import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class Page2 extends StatelessWidget {
  const Page2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset(
          'assets/images/ob2.svg',
          // width: 342.w,
          // height: 342.w,
        ),
        SizedBox(height: 24.h),
        Container(
          width: 327.w,
          height: 192.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1.w, color: grey_2),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('AezaRelease', style: context.s32w500.copyWith(color: black)),
              Text(
                'Приложение предназначено для упрощения процесса выпуска приложений, отслеживания задач, управления проектами и взаимодействия с командой.',
                style: context.s14w400.copyWith(color: black),
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
