import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/enums/task_status.dart';
import 'package:aeza_release/app/internal/widgets/status_menu.dart';
import 'package:aeza_release/app/repository/tasks_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class StatusField extends StatelessWidget {
  const StatusField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            var status = await statusMenu(
              context: context,
              globalKey: globalKey,
              title: 'Текущий статус задачи',
              values: TaskStatus.values,
            );
            if (status != null && context.mounted) {
              context.read<TaskRepo>().status = status;
            }
          },
          child: Container(
            key: globalKey,
            width: 327.w,
            height: 89.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: ShapeDecoration(
              color: bg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.h),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Статус',
                  style: context.s14w500.copyWith(color: blue_3, height: 0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    context.watch<TaskRepo>().status != null
                        ? Text(TaskStatus.values[context.read<TaskRepo>().status!].name, style: context.s14w400.copyWith(color: black))
                        : Text('Текущий статус задачи', style: context.s14w400.copyWith(color: grey_3)),
                    SvgPicture.asset(
                      'assets/icons/Alt Arrow Down.svg',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
