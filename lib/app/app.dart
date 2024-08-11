import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/repository/main_repo.dart';
import 'package:aeza_release/app/repository/projects_repo.dart';
import 'package:aeza_release/app/repository/releases_repo.dart';
import 'package:aeza_release/app/repository/tasks_repo.dart';
import 'package:aeza_release/app/routing/app_router.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final appRouter = AppRouter();

  @override
  void dispose() async {
    await Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => MainRepo()),
          ChangeNotifierProvider(create: (context) => ProjectRepo()),
          ChangeNotifierProvider(create: (context) => TaskRepo()),
          ChangeNotifierProvider(create: (context) => ReleasesRepo()),
        ],
        builder: (context, child) {
          return DevicePreview(
              enabled: !kReleaseMode,
              builder: (context) {
                return ScreenUtilInit(
                  designSize: const Size(375, 812),
                  builder: (context, child) {
                    debugPaintSizeEnabled = false;
                    return MaterialApp.router(
                      debugShowCheckedModeBanner: false,
                      title: 'Aeza Release',
                      localizationsDelegates: const [
                        GlobalMaterialLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate
                      ],
                      supportedLocales: const [Locale('ru', 'RU')],
                      theme: ThemeData(
                        scaffoldBackgroundColor: bg,
                        appBarTheme: AppBarTheme(
                          backgroundColor: bg,
                          centerTitle: false,
                          titleTextStyle: context.s17w500.copyWith(color: black),
                        ),
                        useMaterial3: true,
                      ),
                      routerConfig: appRouter.config(),
                    );
                  },
                );
              });
        });
  }
}
