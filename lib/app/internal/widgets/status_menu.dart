import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

Future<int?> statusMenu({
  required BuildContext context,
  required GlobalKey globalKey,
  required String title,
  required Iterable values,
}) async {
  return await showMenu<int?>(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.h),
    ),
    context: context,
    color: bg,
    surfaceTintColor: bg,
    shadowColor: const Color(0x3FABB1B9),
    position: position(globalKey, context),
    elevation: 10,
    constraints: BoxConstraints(minWidth: 327.w, minHeight: 217.h),
    items: [
      PopupMenuItem<int>(
        enabled: false,
        height: 30.h,
        child: Text('Статус', style: context.s14w500.copyWith(color: blue_3)),
      ),
      PopupMenuItem<int>(
        height: 30.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: context.s14w400.copyWith(color: grey_3)),
            SvgPicture.asset('assets/icons/Alt Arrow Up.svg', width: 24.w, height: 24.h),
          ],
        ),
      ),
      const PopupMenuDivider(),
      for (var status in values) ...[
        PopupMenuItem<int>(
          value: status.index,
          height: 30.h,
          child: Text(status.name, style: context.s14w400.copyWith(color: black)),
        ),
      ],
    ],
  );
}
