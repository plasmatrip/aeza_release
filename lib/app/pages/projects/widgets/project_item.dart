import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/enums/project_status.dart';
import 'package:aeza_release/app/internal/widgets/delete_dalog.dart';
import 'package:aeza_release/app/internal/widgets/edit_delete_dialog.dart';
import 'package:aeza_release/app/internal/widgets/status_dialog.dart';
import 'package:aeza_release/app/models/project.dart';
import 'package:aeza_release/app/repository/projects_repo.dart';
import 'package:aeza_release/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    required this.project,
    super.key,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async => AutoRouter.of(context).push(SelectedProjectView(projectKey: project.key)),
      child: Container(
        width: 327.w,
        height: 93.h,
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
                color: ProjectStatus.values[project.status!].color,
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
                              color: ProjectStatus.values[project.status!].color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.h),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                ProjectStatus.values[project.status!].name,
                                style: context.s8w400.copyWith(color: ProjectStatus.values[project.status!].textColor),
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
                            project.name,
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
                                    title: 'Выберите статус проекта',
                                    values: ProjectStatus.values,
                                  );
                                  if (result != null && context.mounted) {
                                    context.read<ProjectRepo>().setStatus(project.key, result);
                                  }
                                case 'EDIT':
                                  context.read<ProjectRepo>().edit(project.key);
                                  AutoRouter.of(context).push(const AddProject());
                                case 'DELETE':
                                  var result = await deleteDialog(context, 'Хотите удалить проект?\nБудут удалены все связанные задачи и релизы!');
                                  if (result == 'DELETE' && context.mounted) {
                                    context.read<ProjectRepo>().delete(key: project.key);
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
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RichText(
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
                        SizedBox(height: 4.h),
                        LinearProgressIndicator(
                          value: context.read<ProjectRepo>().progress(project),
                          color: ProjectStatus.values[project.status!].color,
                          backgroundColor: grey_2,
                        ),
                        SizedBox(height: 16.h),
                      ],
                    )
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
