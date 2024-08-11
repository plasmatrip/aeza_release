import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<String?> editDeleteDialog(BuildContext context, GlobalKey globalKey, [bool showDoneItem = false]) async {
  return await showMenu<String?>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.h),
    ),
    context: context,
    color: bg,
    surfaceTintColor: bg,
    position: position(globalKey, context),
    elevation: 10,
    constraints: BoxConstraints(maxWidth: 149.w, maxHeight: 128.h),
    items: [
      PopupMenuItem<String>(
        padding: EdgeInsets.only(left: 14.w, right: 14.w),
        value: 'STATUS',
        height: 30.h,
        child: Row(
          children: [
            Text('Изменить статус', style: context.s14w400.copyWith(color: black)),
          ],
        ),
      ),
      PopupMenuItem<String>(
        padding: EdgeInsets.only(left: 14.w, right: 14.w),
        value: 'EDIT',
        height: 30.h,
        child: Row(
          children: [
            Text('Редактировать ', style: context.s14w400.copyWith(color: black)),
          ],
        ),
      ),
      const PopupMenuDivider(),
      PopupMenuItem<String>(
        padding: EdgeInsets.only(left: 14.w, right: 14.w),
        value: 'DELETE',
        height: 30.h,
        child: Row(
          children: [
            Text('Удалить ', style: context.s14w400.copyWith(color: red)),
          ],
        ),
      ),
    ],
  );
}
