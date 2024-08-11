import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/enums/project_status.dart';
import 'package:aeza_release/app/models/project.dart';
import 'package:aeza_release/app/repository/projects_repo.dart';
import 'package:aeza_release/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SelectedProjectView extends StatelessWidget {
  const SelectedProjectView({required this.projectKey, super.key});

  final int projectKey;

  @override
  Widget build(BuildContext context) {
    Project project = context.watch<ProjectRepo>().repo.get(projectKey);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async => AutoRouter.of(context).removeLast(),
          child: Icon(Icons.arrow_back, color: black, size: 24.h),
        ),
        title: Text(project.name),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.h),
            bottomRight: Radius.circular(16.h),
          ),
        ),
        backgroundColor: blue_1,
        actions: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              context.read<ProjectRepo>().edit(project.key);
              AutoRouter.of(context).push(const AddProject());
            },
            child: Padding(
              padding: EdgeInsets.only(right: 24.w),
              child: SvgPicture.asset('assets/icons/Pen 2.svg', width: 24.w, height: 24.h),
            ),
          )
        ],
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
                borderRadius: BorderRadius.circular(16.h),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: IntrinsicWidth(
                    child: Container(
                      height: 20.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: ShapeDecoration(
                        color: ProjectStatus.values[project.status!].color,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.h),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          ProjectStatus.values[project.status!].name,
                          style: context.s10w400.copyWith(color: ProjectStatus.values[project.status!].textColor),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  project.name,
                  style: context.s40w500.copyWith(color: black),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 16.h),
                Container(
                  width: 295.w,
                  padding: EdgeInsets.only(top: 4.h, left: 8.w, bottom: 4.h),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 1.w, color: blue_2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/Rocket 2.svg', width: 17.w, height: 17.h),
                          SizedBox(width: 4.w),
                          Text(DateFormat('dd.MM.y', 'ru').format(project.start!), style: context.s14w400.copyWith(color: black)),
                        ],
                      ),
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/Rocket.svg', width: 17.w, height: 17.h),
                          SizedBox(width: 4.w),
                          Text(DateFormat('dd.MM.y', 'ru').format(project.end!), style: context.s14w400.copyWith(color: black)),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  width: 295.w,
                  padding: EdgeInsets.only(top: 4.h, left: 8.w, bottom: 4.h),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 1.w, color: blue_2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Описание', style: context.s14w400.copyWith(color: grey_3)),
                      SizedBox(height: 8.h),
                      Text(project.description, style: context.s14w400.copyWith(color: black)),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  width: 295.w,
                  padding: EdgeInsets.only(top: 4.h, left: 8.w, bottom: 4.h),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 1.w, color: blue_2),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Задачи', style: context.s14w400.copyWith(color: grey_3)),
                      SizedBox(height: 8.h),
                      Align(
                        alignment: Alignment.centerRight,
                        child: RichText(
                          text: TextSpan(
                              text: '${context.select<ProjectRepo, int>((p) => p.completeTasks(project))} ',
                              style: context.s10w400.copyWith(color: black),
                              children: [
                                TextSpan(
                                  text: '/ ${context.select<ProjectRepo, int>((p) => p.tasks(project))}',
                                  style: context.s10w400.copyWith(color: grey_3),
                                )
                              ]),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      LinearProgressIndicator(
                        value: context.read<ProjectRepo>().progress(project),
                        color: ProjectStatus.values[project.status!].color,
                        backgroundColor: grey_2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
