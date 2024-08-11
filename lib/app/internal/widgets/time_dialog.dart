import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wheel_picker/wheel_picker.dart';

Future<DateTime?> timeDialog(BuildContext context, DateTime? selectedTime) {
  selectedTime ??= DateTime.now();
  int hour = selectedTime.hour;
  int minute = selectedTime.minute;

  late final hoursWheel = WheelPickerController(
    itemCount: 24,
    initialIndex: hour,
  );
  late final minutesWheel = WheelPickerController(
    itemCount: 60,
    initialIndex: minute,
    mounts: [hoursWheel],
  );
  final wheelStyle = WheelPickerStyle(
    // size: 90.h,
    itemExtent: 24.h,
    squeeze: 1.45,
    diameterRatio: 1.1,
    surroundingOpacity: .15,
    magnification: 1.2,
  );

  Widget itemBuilder(BuildContext context, int index) {
    return Text("$index".padLeft(2, '0'), style: context.s16w500.copyWith(color: black));
  }

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
            contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            clipBehavior: Clip.none,
            content: SizedBox(
              width: 237.w,
              height: 155.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 50.w,
                        height: 75.h,
                        child: WheelPicker(
                          builder: itemBuilder,
                          controller: hoursWheel,
                          style: wheelStyle,
                          onIndexChanged: (index) => hour = index,
                        ),
                      ),
                      Text(' : ', style: context.s16w500.copyWith(color: black)),
                      SizedBox(
                        width: 50.w,
                        height: 75.h,
                        child: WheelPicker(
                          builder: itemBuilder,
                          controller: minutesWheel,
                          style: wheelStyle,
                          enableTap: true,
                          onIndexChanged: (index) => minute = index,
                        ),
                      )
                    ],
                  ),
                  FilledButton(
                    style: context.extraBtn.copyWith(
                      fixedSize: WidgetStatePropertyAll(Size(100.w, 36.h)),
                      textStyle: WidgetStatePropertyAll(context.s15w500),
                    ),
                    onPressed: () => AutoRouter.of(context).maybePop(DateTime(selectedTime!.year, selectedTime.month, selectedTime.day, hour, minute)),
                    child: const Text('Выбрать'),
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
