import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/enums/filters.dart';
import 'package:aeza_release/app/internal/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<int?> filterMenu({
  required BuildContext context,
  required GlobalKey globalKey,
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
        child: Align(alignment: Alignment.centerRight, child: Text('Фильтр', style: context.s14w500.copyWith(color: blue_3))),
      ),
      const PopupMenuDivider(),
      for (var filter in Filters.values) ...[
        PopupMenuItem<int>(
          value: filter.index,
          height: 30.h,
          child: Text(filter.name, style: context.s14w400.copyWith(color: black)),
        ),
      ],
    ],
  );
}
