import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/pages/main_navigation/widgets/calendar_timeline.dart';
import 'package:aeza_release/app/pages/main_navigation/widgets/projects.dart';
import 'package:aeza_release/app/pages/main_navigation/widgets/releases.dart';
import 'package:aeza_release/app/pages/main_navigation/widgets/tasks.dart';
import 'package:aeza_release/app/pages/main_navigation/widgets/work_type_selector.dart';
import 'package:aeza_release/app/pages/main_navigation/widgets/work_view.dart';
import 'package:aeza_release/app/pages/projects/widgets/project_item.dart';
import 'package:aeza_release/app/pages/releases/widgets/release_item.dart';
import 'package:aeza_release/app/pages/tasks/widgets/task_item.dart';
import 'package:aeza_release/app/repository/main_repo.dart';
import 'package:aeza_release/app/repository/projects_repo.dart';
import 'package:aeza_release/app/repository/releases_repo.dart';
import 'package:aeza_release/app/repository/tasks_repo.dart';
import 'package:aeza_release/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainView();
}

class _MainView extends State<MainNavigation> {
  @override
  Widget build(BuildContext context) {
    DateTime selectedDate = context.select<MainRepo, DateTime>((p) => p.selectedDate);
    return Scaffold(
      appBar: AppBar(
        title: Text.rich(
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 24.w),
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () async => AutoRouter.of(context).push(const SettingsView()),
              child: Container(
                width: 36.h,
                height: 36.h,
                decoration: const ShapeDecoration(
                  color: black,
                  shape: OvalBorder(),
                ),
                child: SvgPicture.asset('assets/icons/Settings.svg', fit: BoxFit.none),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
        child: Column(
          children: [
            const Projects(),
            SizedBox(height: 16.h),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Tasks(),
                Releases(),
              ],
            ),
            SizedBox(height: 24.h),
            const CalendarTimeline(),
            SizedBox(height: 16.h),
            const WorkTypeSelector(),
            SizedBox(height: 12.h),
            switch (context.select<MainRepo, WorkType>((p) => p.selectedWorkType)) {
              WorkType.projects => WorkView(
                  observable: context.watch<ProjectRepo>().projectsByDate(selectedDate),
                  itemBuilder: (project) => ProjectItem(project: project),
                ),
              WorkType.releases => WorkView(
                  observable: context.watch<ReleasesRepo>().releasesByDate(selectedDate),
                  itemBuilder: (release) => ReleaseItem(release: release),
                ),
              WorkType.tasks => WorkView(
                  observable: context.watch<TaskRepo>().tasksByDate(selectedDate),
                  itemBuilder: (task) => TaskItem(task: task),
                ),
            }
          ],
        ),
      ),
    );
  }
}
