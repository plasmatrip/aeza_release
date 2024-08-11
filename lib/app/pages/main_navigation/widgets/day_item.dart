import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class DayItem extends StatelessWidget {
  const DayItem({
    required this.date,
    required this.isSelected,
    super.key,
    this.onTap,
  });

  final DateTime date;
  final bool isSelected;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    final DateTime now = DateTime.now();
    return Container(
      width: 31.w,
      height: 42.h,
      decoration: isSelected
          ? ShapeDecoration(
              color: blue_2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
            )
          : datesIsEqual(date, now)
              ? ShapeDecoration(
                  color: grey_1,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: blue_2, width: 1.h),
                    borderRadius: BorderRadius.circular(12.h),
                  ),
                )
              : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 2.h),
          Text(
            DateFormat('E', 'ru').format(date),
            style: isSelected
                ? context.s10w400.copyWith(color: bg)
                : date.weekday == DateTime.saturday || date.weekday == DateTime.sunday
                    ? context.s10w400.copyWith(color: red)
                    : context.s10w400.copyWith(color: grey_3),
          ),
          SizedBox(height: 2.h),
          Text(
            date.day.toString(),
            style: isSelected ? context.s14w400.copyWith(color: bg) : context.s14w400.copyWith(color: grey_3),
          ),
          // SizedBox(height: 2.h),
        ],
      ),
    );
  }
}
