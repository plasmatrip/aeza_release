import 'package:aeza_release/app/internal/const/boxes.dart';
import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/utils.dart';
import 'package:aeza_release/app/models/settings.dart';
import 'package:aeza_release/app/pages/onboarding/widgets/page1.dart';
import 'package:aeza_release/app/pages/onboarding/widgets/page2.dart';
import 'package:aeza_release/app/pages/onboarding/widgets/page3.dart';
import 'package:aeza_release/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

@RoutePage()
class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController controller = PageController();
  bool start = false;

  void listener() {
    switch (controller.position.userScrollDirection) {
      case ScrollDirection.reverse:
        if ((controller.page ?? 0) > 1) {
          setState(
            () {
              start = true;
            },
          );
        }
      case ScrollDirection.forward:
        if ((controller.page ?? 0) < 2) {
          setState(
            () {
              start = false;
            },
          );
        }
      case ScrollDirection.idle:
        if ((controller.page ?? 0) >= 2) {
          setState(
            () {
              start = true;
            },
          );
        }
    }
  }

  @override
  void initState() {
    controller.addListener(listener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: controller,
              children: const [
                Page1(),
                Page2(),
                Page3(),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (start) ...[
                  FilledButton(
                    onPressed: () async {
                      Settings settings = Hive.box<Settings>(Boxes.settings).getAt(0)!;
                      settings.showOnboarding = false;
                      settings.save();
                      AutoRouter.of(context).replace(const MainNavigation());
                    },
                    style: context.extraBtn,
                    child: const Text('Начать'),
                  ),
                ] else ...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FilledButton(
                        onPressed: () async => AutoRouter.of(context).replace(const MainNavigation()),
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(grey_1),
                          foregroundColor: const WidgetStatePropertyAll(black),
                          fixedSize: WidgetStatePropertyAll(Size(138.w, 48.h)),
                          textStyle: WidgetStatePropertyAll(context.s18w500),
                          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10.w)),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              side: BorderSide(width: 1.w, color: black),
                              borderRadius: BorderRadius.circular(16.h),
                            ),
                          ),
                        ),
                        child: const Text('Пропустить'),
                      ),
                      FilledButton(
                        onPressed: () async => controller.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        ),
                        style: context.extraBtn.copyWith(
                          fixedSize: WidgetStatePropertyAll(Size(174.w, 48.h)),
                        ),
                        child: const Text('Далее'),
                      ),
                    ],
                  ),
                ],
                SizedBox(height: 16.h),
                IntrinsicHeight(
                  child: Row(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () async => openUrl(Hive.box<Settings>(Boxes.settings).getAt(0)!.termsOfUseUri),
                        child: SizedBox(
                          width: 150.w,
                          child: Text(
                            'Условия использования',
                            style: context.s10w400.copyWith(color: grey_3, letterSpacing: -0.5.w),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                      VerticalDivider(color: black, thickness: 0.5.w, width: 20.w),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () async => openUrl(Hive.box<Settings>(Boxes.settings).getAt(0)!.privacyPolicyUri),
                        child: SizedBox(
                          width: 150.w,
                          child: Text(
                            'Политика конфиденциальности',
                            style: context.s10w400.copyWith(color: grey_3, letterSpacing: -0.5.w),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
