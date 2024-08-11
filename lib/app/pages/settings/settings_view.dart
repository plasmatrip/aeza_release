import 'package:aeza_release/app/internal/const/boxes.dart';
import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/utils.dart';
import 'package:aeza_release/app/models/settings.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:in_app_review/in_app_review.dart';

@RoutePage()
class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.h),
            bottomRight: Radius.circular(16.h),
          ),
        ),
        toolbarHeight: 100.h,
        backgroundColor: blue_1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Aeza',
                    style: context.s36w700.copyWith(color: black),
                  ),
                  TextSpan(
                    text: 'Release',
                    style: context.s36w700.copyWith(color: black, fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.h),
            Text('Настройки', style: context.s22w500.copyWith(color: black)),
            SizedBox(height: 16.h),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async => openUrl(Hive.box<Settings>(Boxes.settings).getAt(0)!.privacyPolicyUri),
              child: Container(
                width: 327.w,
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: ShapeDecoration(
                  color: grey_1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.h),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Политика конфиденциальности ', style: context.s15w500.copyWith(color: black)),
                    SvgPicture.asset('assets/icons/Lock.svg', width: 24.h, height: 24.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async => openUrl(Hive.box<Settings>(Boxes.settings).getAt(0)!.termsOfUseUri),
              child: Container(
                width: 327.w,
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: ShapeDecoration(
                  color: grey_1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.h),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Пользовательское соглашение', style: context.s15w500.copyWith(color: black)),
                    SvgPicture.asset('assets/icons/Document Add.svg', width: 24.h, height: 24.h),
                  ],
                ),
              ),
            ),
            SizedBox(height: 32.h),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async {
                final InAppReview inAppReview = InAppReview.instance;
                if (await inAppReview.isAvailable()) {
                  await inAppReview.requestReview();
                }
              },
              child: Container(
                width: 327.w,
                height: 56.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: ShapeDecoration(
                  color: grey_1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.h),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Оценить приложение', style: context.s15w500.copyWith(color: black)),
                    SvgPicture.asset('assets/icons/Heart.svg', width: 24.h, height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledButton(
        onPressed: () => AutoRouter.of(context).removeLast(),
        style: context.extraBtn,
        child: const Text('Назад'),
      ),
    );
  }
}
