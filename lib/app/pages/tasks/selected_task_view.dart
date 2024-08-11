import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/enums/task_status.dart';
import 'package:aeza_release/app/internal/widgets/status_dialog.dart';
import 'package:aeza_release/app/models/project.dart';
import 'package:aeza_release/app/models/task.dart';
import 'package:aeza_release/app/repository/tasks_repo.dart';
import 'package:aeza_release/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SelectedTaskView extends StatelessWidget {
  const SelectedTaskView({required this.taskKey, super.key});

  final int taskKey;

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    Task task = context.watch<TaskRepo>().repo.get(taskKey);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async => AutoRouter.of(context).removeLast(),
          child: Icon(Icons.arrow_back, color: black, size: 24.h),
        ),
        title: Text(task.name),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.h),
            bottomRight: Radius.circular(16.h),
          ),
        ),
        backgroundColor: blue_1,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h, bottom: 100.h),
          child: Container(
            width: 327.w,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: ShapeDecoration(
              color: grey_1,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1.w, color: grey_2),
                borderRadius: BorderRadius.circular(16.h),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.name,
                  style: context.s18w500.copyWith(color: black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    (task.project!.single as Project).name,
                    style: context.s14w500.copyWith(color: grey_3),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                  ),
                ),
                Divider(color: grey_2, thickness: 0.5.h, height: 32.h),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset('assets/icons/User Hand Up.svg', width: 17.w, height: 17.h),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: Text(
                        task.employees.join(', '),
                        style: context.s14w400.copyWith(color: black),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Text(
                  task.description,
                  style: context.s14w400.copyWith(color: black),
                ),
                SizedBox(height: 16.h),
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
                    Text('${DateFormat('HH:mm', 'ru').format(task.endTime!)}, ${DateFormat('dd.MM.y', 'ru').format(task.endDate!)}', style: context.s10w400),
                  ],
                ),
                SizedBox(height: 4.h),
                LinearProgressIndicator(
                  value: context.read<TaskRepo>().progress(task),
                  color: TaskStatus.values[task.status!].color,
                  backgroundColor: grey_2,
                ),
                SizedBox(height: 16.h),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    var status = await statusDialog(
                      context: context,
                      globalKey: globalKey,
                      title: 'Выберите статус задачи',
                      values: TaskStatus.values,
                    );
                    if (status != null && context.mounted) {
                      context.read<TaskRepo>().setStatus(task.key, status);
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Статус задачи', style: context.s14w400.copyWith(color: grey_3)),
                      const Spacer(),
                      Text(TaskStatus.values[task.status!].name, style: context.s14w400.copyWith(color: black)),
                      SizedBox(width: 8.w),
                      SvgPicture.asset(
                        key: globalKey,
                        'assets/icons/Alt Arrow Down.svg',
                        width: 24.w,
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 32.h),
                FilledButton(
                  onPressed: () async {
                    context.read<TaskRepo>().edit(task.key);
                    AutoRouter.of(context).push(const AddTask());
                  },
                  style: context.extraBtn.copyWith(
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        side: BorderSide(width: 1.w, color: black),
                        borderRadius: BorderRadius.circular(16.h),
                      ),
                    ),
                    backgroundColor: const WidgetStatePropertyAll(grey_1),
                    foregroundColor: const WidgetStatePropertyAll(black),
                    fixedSize: WidgetStatePropertyAll(Size(2385.w, 36.h)),
                    textStyle: WidgetStatePropertyAll(context.s15w500),
                  ),
                  child: const Text('Редактировать'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
