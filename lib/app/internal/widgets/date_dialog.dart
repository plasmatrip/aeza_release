import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

Future<DateTime?> dateDialog(BuildContext context, DateTime? selectedDate, [bool showEvents = false]) {
  const monthName = ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'];
  selectedDate ??= DateTime.now();

  return showDialog<DateTime>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.h)),
            backgroundColor: bg,
            surfaceTintColor: bg,
            insetPadding: EdgeInsets.zero,
            contentPadding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 24.h),
            clipBehavior: Clip.none,
            content: SizedBox(
              width: 327.w,
              height: 298.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TableCalendar(
                    locale: 'ru',
                    focusedDay: selectedDate!,
                    firstDay: DateTime(2010, 1, 1),
                    lastDay: DateTime(2035, 1, 1),
                    rowHeight: 26.h,
                    weekNumbersVisible: false,
                    calendarFormat: CalendarFormat.month,
                    startingDayOfWeek: StartingDayOfWeek.monday,
                    calendarStyle: CalendarStyle(
                      cellAlignment: Alignment.center,
                      cellMargin: EdgeInsets.all(3.h),
                      cellPadding: EdgeInsets.zero,
                      outsideDaysVisible: true,
                      defaultTextStyle: context.s12w400.copyWith(color: black),
                      selectedTextStyle: context.s12w400.copyWith(color: bg),
                      selectedDecoration: ShapeDecoration(
                        color: black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.h),
                        ),
                      ),
                      todayTextStyle: context.s12w400.copyWith(color: black),
                      todayDecoration: ShapeDecoration(
                        color: bg,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.h, color: black),
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      weekendTextStyle: context.s12w400.copyWith(color: black),
                      outsideTextStyle: context.s12w400.copyWith(color: grey_2),
                    ),
                    onDaySelected: (selectedDay, focusedDay) {
                      setState(() {
                        selectedDate = selectedDay;
                      });
                    },
                    selectedDayPredicate: (day) {
                      return isSameDay(selectedDate, day);
                    },
                    headerStyle: HeaderStyle(
                      titleTextFormatter: (date, locale) => '${monthName[date.month - 1]} ${DateFormat.y('ru').format(date)}',
                      titleCentered: true,
                      headerPadding: EdgeInsets.zero,
                      headerMargin: EdgeInsets.zero,
                      formatButtonVisible: false,
                      rightChevronMargin: EdgeInsets.zero,
                      leftChevronMargin: EdgeInsets.zero,
                      titleTextStyle: context.s14w400.copyWith(color: black),
                      leftChevronIcon: Icon(Icons.arrow_back_ios, color: grey_2, size: 24.h),
                      rightChevronIcon: Icon(Icons.arrow_forward_ios, color: black, size: 24.h),
                    ),
                    daysOfWeekHeight: 20.h,
                    daysOfWeekStyle: DaysOfWeekStyle(
                      weekdayStyle: context.s10w400.copyWith(color: grey_3),
                      weekendStyle: context.s10w400.copyWith(color: grey_3),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FilledButton(
                        onPressed: () => AutoRouter.of(context).maybePop(),
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(grey_1),
                          foregroundColor: const WidgetStatePropertyAll(black),
                          fixedSize: WidgetStatePropertyAll(Size(96.w, 36.h)),
                          textStyle: WidgetStatePropertyAll(context.s15w500),
                          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              side: BorderSide(width: 1.w, color: black),
                              borderRadius: BorderRadius.circular(16.h),
                            ),
                          ),
                        ),
                        child: const Text('Закрыть'),
                      ),
                      FilledButton(
                        onPressed: () => AutoRouter.of(context).maybePop(selectedDate),
                        style: context.extraBtn.copyWith(
                          fixedSize: WidgetStatePropertyAll(Size(160.w, 36.h)),
                          textStyle: WidgetStatePropertyAll(context.s15w500),
                        ),
                        child: const Text('Выбрать'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
