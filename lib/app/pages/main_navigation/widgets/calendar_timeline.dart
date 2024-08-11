import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/pages/main_navigation/widgets/day_item.dart';
import 'package:aeza_release/app/repository/main_repo.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';
import 'package:provider/provider.dart';

class CalendarTimeline extends StatelessWidget {
  const CalendarTimeline({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final EasyInfiniteDateTimelineController controller = EasyInfiniteDateTimelineController();
    return Container(
      width: 327.w,
      height: 110.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: ShapeDecoration(
        color: grey_1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.h),
        ),
      ),
      child: EasyInfiniteDateTimeLine(
        controller: controller,
        locale: 'ru',
        selectionMode: const SelectionMode.none(),
        firstDate: DateTime(2014, 1, 1),
        lastDate: DateTime(2034, 1, 1),
        focusDate: context.watch<MainRepo>().selectedDate,
        onDateChange: (selectedDate) {
          context.read<MainRepo>().selectedDate = selectedDate;
        },
        headerBuilder: (context, date) {
          return Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      context.read<MainRepo>().selectedDate = Jiffy.parseFromDateTime(context.read<MainRepo>().selectedDate).subtract(months: 1).dateTime;
                      controller.animateToDate(context.read<MainRepo>().selectedDate);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: grey_3,
                      size: 24.h,
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Text(
                    DateFormat('MMMM', 'ru').format(date),
                    style: context.s19w500.copyWith(color: black),
                  ),
                  const Spacer(),
                  Text(
                    DateFormat('y', 'ru').format(date),
                    style: context.s14w400.copyWith(color: grey_3),
                  ),
                  SizedBox(width: 15.w),
                  GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      context.read<MainRepo>().selectedDate = Jiffy.parseFromDateTime(context.read<MainRepo>().selectedDate).add(months: 1).dateTime;
                      controller.animateToDate(context.read<MainRepo>().selectedDate);
                    },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: black,
                      size: 24.h,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
            ],
          );
        },
        dayProps: EasyDayProps(
          width: 31.w,
          height: 42.h,
        ),
        itemBuilder: (context, date, isSelected, onTap) {
          return InkWell(
            onTap: onTap,
            child: DayItem(date: date, isSelected: isSelected, onTap: onTap),
          );
        },
      ),
    );
  }
}
