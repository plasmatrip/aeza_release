import 'package:aeza_release/app/app.dart';
import 'package:aeza_release/app/internal/const/boxes.dart';
import 'package:aeza_release/app/models/project.dart';
import 'package:aeza_release/app/models/release.dart';
import 'package:aeza_release/app/models/settings.dart';
import 'package:aeza_release/app/models/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:jiffy/jiffy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter<Settings>(SettingsAdapter());
  Hive.registerAdapter<Project>(ProjectAdapter());
  Hive.registerAdapter<Task>(TaskAdapter());
  Hive.registerAdapter<Release>(ReleaseAdapter());

  await Hive.openBox<Settings>(Boxes.settings);
  await Hive.openBox<Project>(Boxes.projects);
  await Hive.openBox<Task>(Boxes.tasks);
  await Hive.openBox<Release>(Boxes.releases);

  Jiffy.setLocale('ru');

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => initializeDateFormatting('ru', null).then(
      (_) => runApp(
        const App(),
      ),
    ),
  );
}
