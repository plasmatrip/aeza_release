import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension UI on BuildContext {
  TextStyle get s40w500 => TextStyle(fontSize: 40.h, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  TextStyle get s36w700 => TextStyle(fontSize: 36.h, fontFamily: 'Inter', fontWeight: FontWeight.w700);
  TextStyle get s32w500 => TextStyle(fontSize: 32.h, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  TextStyle get s24w500 => TextStyle(fontSize: 24.h, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  TextStyle get s22w500 => TextStyle(fontSize: 22.h, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  TextStyle get s19w500 => TextStyle(fontSize: 19.h, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  TextStyle get s18w500 => TextStyle(fontSize: 18.h, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  TextStyle get s17w500 => TextStyle(fontSize: 17.h, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  TextStyle get s16w500 => TextStyle(fontSize: 16.h, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  TextStyle get s16w400 => TextStyle(fontSize: 16.h, fontFamily: 'Inter', fontWeight: FontWeight.w400);
  TextStyle get s15w500 => TextStyle(fontSize: 15.h, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  TextStyle get s15w400 => TextStyle(fontSize: 15.h, fontFamily: 'Inter', fontWeight: FontWeight.w400);
  TextStyle get s14w500 => TextStyle(fontSize: 14.h, fontFamily: 'Inter', fontWeight: FontWeight.w500);
  TextStyle get s14w400 => TextStyle(fontSize: 14.h, fontFamily: 'Inter', fontWeight: FontWeight.w400);
  TextStyle get s12w400 => TextStyle(fontSize: 12.h, fontFamily: 'Inter', fontWeight: FontWeight.w400);
  TextStyle get s10w400 => TextStyle(fontSize: 10.h, fontFamily: 'Inter', fontWeight: FontWeight.w400);
  TextStyle get s8w400 => TextStyle(fontSize: 8.h, fontFamily: 'Inter', fontWeight: FontWeight.w400);

  ButtonStyle get extraBtn => FilledButton.styleFrom(
        fixedSize: Size(327.w, 48.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.h)),
        backgroundColor: black,
        foregroundColor: bg,
        disabledBackgroundColor: grey_2,
        disabledForegroundColor: grey_3,
        textStyle: s18w500,
      );
}
