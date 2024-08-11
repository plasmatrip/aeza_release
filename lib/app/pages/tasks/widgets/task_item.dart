import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/enums/task_status.dart';
import 'package:aeza_release/app/internal/widgets/delete_dalog.dart';
import 'package:aeza_release/app/internal/widgets/edit_delete_dialog.dart';
import 'package:aeza_release/app/internal/widgets/status_dialog.dart';
import 'package:aeza_release/app/models/project.dart';
import 'package:aeza_release/app/models/task.dart';
import 'package:aeza_release/app/repository/tasks_repo.dart';
import 'package:aeza_release/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    required this.task,
    super.key,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async => AutoRouter.of(context).push(SelectedTaskView(taskKey: task.key)),
      child: Container(
        width: 327.w,
        height: 146.h,
        decoration: ShapeDecoration(
          color: grey_1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 13.w,
              decoration: ShapeDecoration(
                color: TaskStatus.values[task.status!].color,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.h),
                    bottomLeft: Radius.circular(16.h),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.only(right: 40.w),
                        child: IntrinsicWidth(
                          child: Container(
                            height: 14.h,
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: ShapeDecoration(
                              color: TaskStatus.values[task.status!].color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.h),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                TaskStatus.values[task.status!].name,
                                style: context.s8w400.copyWith(color: black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 3.h),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            task.name,
                            style: context.s18w500.copyWith(color: black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () async {
                            var result = await editDeleteDialog(context, globalKey);
                            if (context.mounted) {
                              switch (result) {
                                case 'STATUS':
                                  var result = await statusDialog(
                                    context: context,
                                    globalKey: globalKey,
                                    title: 'Выберите статус задачи',
                                    values: TaskStatus.values,
                                  );
                                  if (result != null && context.mounted) {
                                    context.read<TaskRepo>().setStatus(task.key, result);
                                  }
                                case 'EDIT':
                                  context.read<TaskRepo>().edit(task.key);
                                  AutoRouter.of(context).push(const AddTask());
                                case 'DELETE':
                                  var result = await deleteDialog(context, 'Хотите удалить задачу?');
                                  if (result == 'DELETE' && context.mounted) {
                                    context.read<TaskRepo>().delete(key: task.key);
                                  }
                              }
                            }
                          },
                          child: SvgPicture.asset(
                            key: globalKey,
                            'assets/icons/Menu Dots.svg',
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ],
                    ),
                    Text((task.project!.single as Project).name, style: context.s14w500.copyWith(color: grey_3)),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset('assets/icons/Rocket 2.svg', width: 17.w, height: 17.h),
                        SizedBox(width: 4.w),
                        Text('${DateFormat('HH:mm', 'ru').format(task.startTime!)}, ${DateFormat('dd.MM.y', 'ru').format(task.startDate!)}',
                            style: context.s10w400),
                        const Spacer(),
                        SvgPicture.asset('assets/icons/Rocket.svg', width: 17.w, height: 17.h),
                        SizedBox(width: 4.w),
                        Text('${DateFormat('HH:mm', 'ru').format(task.endTime!)}, ${DateFormat('dd.MM.y', 'ru').format(task.endDate!)}',
                            style: context.s10w400),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    LinearProgressIndicator(
                      value: context.read<TaskRepo>().progress(task),
                      color: TaskStatus.values[task.status!].color,
                      backgroundColor: grey_2,
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset('assets/icons/User Hand Up.svg', width: 17.w, height: 17.h),
                        Expanded(
                          child: Text(
                            task.employees.join(','),
                            style: context.s14w400.copyWith(color: black),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
