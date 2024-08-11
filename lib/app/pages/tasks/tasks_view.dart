import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/models/task.dart';
import 'package:aeza_release/app/pages/tasks/widgets/filter_menu.dart';
import 'package:aeza_release/app/pages/tasks/widgets/task_item.dart';
import 'package:aeza_release/app/repository/tasks_repo.dart';
import 'package:aeza_release/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

@RoutePage()
class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    Iterable tasks = context.watch<TaskRepo>().tasks();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.h),
            bottomRight: Radius.circular(16.h),
          ),
        ),
        toolbarHeight: 100.h,
        backgroundColor: blue_1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Aeza',
                        style: context.s36w700.copyWith(color: black),
                      ),
                      TextSpan(
                        text: 'Release',
                        style: context.s36w700.copyWith(color: black, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async => AutoRouter.of(context).removeLast(),
                  child: Container(
                    width: 36.h,
                    height: 36.h,
                    decoration: const ShapeDecoration(
                      color: black,
                      shape: OvalBorder(),
                    ),
                    child: Icon(Icons.close, color: bg, size: 24.h),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text('Задачи', style: context.s22w500.copyWith(color: black)),
                const Spacer(),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    var filter = await filterMenu(context: context, globalKey: globalKey);
                    if (filter != null && context.mounted) {
                      context.read<TaskRepo>().filter = filter;
                    }
                  },
                  child: SvgPicture.asset(
                    key: globalKey,
                    'assets/icons/Sort Vertical.svg',
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h, bottom: 100.h),
        itemCount: tasks.length,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          Task task = tasks.elementAt(index);
          return TaskItem(task: task);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledButton(
        onPressed: () async => AutoRouter.of(context).push(const AddTask()),
        style: context.extraBtn,
        child: const Text('Добавить задачу'),
      ),
    );
  }
}
