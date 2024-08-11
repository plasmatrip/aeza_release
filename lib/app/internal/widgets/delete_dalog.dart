import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<String?> deleteDialog(BuildContext context, String question) {
  return showDialog<String>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.h)),
            backgroundColor: bg,
            surfaceTintColor: bg,
            elevation: 10,
            actionsPadding: EdgeInsets.zero,
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              Container(
                width: 343.w,
                // height: 176.h,
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.h),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Удаление', style: context.s24w500.copyWith(color: red)),
                    SizedBox(height: 12.h),
                    Text(
                      question,
                      style: context.s15w400.copyWith(color: black),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FilledButton(
                          style: FilledButton.styleFrom(
                            fixedSize: Size(96.w, 36.h),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1.w, color: black),
                              borderRadius: BorderRadius.circular(16.h),
                            ),
                            backgroundColor: bg,
                            foregroundColor: black,
                          ),
                          onPressed: () => Navigator.of(context, rootNavigator: true).pop('CANCEL'),
                          child: Center(
                            child: Text('Закрыть', style: context.s15w500),
                          ),
                        ),
                        FilledButton(
                          style: FilledButton.styleFrom(
                            fixedSize: Size(136.w, 36.h),
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.h),
                            ),
                            backgroundColor: red,
                            foregroundColor: bg,
                          ),
                          onPressed: () => Navigator.of(context, rootNavigator: true).pop('DELETE'),
                          child: Center(
                            child: Text('Удалить', style: context.s15w500),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
