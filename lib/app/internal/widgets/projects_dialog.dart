import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/widgets/project_tiny_item.dart';
import 'package:aeza_release/app/internal/widgets/search_field.dart';
import 'package:aeza_release/app/models/project.dart';
import 'package:aeza_release/app/repository/projects_repo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Future<Project?> projectsDialog(BuildContext context) {
  return showDialog<Project?>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          Iterable projects = context.watch<ProjectRepo>().projects();
          return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.h)),
            backgroundColor: bg,
            surfaceTintColor: bg,
            elevation: 10,
            actionsPadding: EdgeInsets.zero,
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              Container(
                width: 327.w,
                height: 333.h,
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.h),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Выберите проект', style: context.s16w400.copyWith(color: grey_3)),
                    SizedBox(height: 20.h),
                    const SearchField(),
                    SizedBox(height: 20.h),
                    Expanded(
                      child: ListView.separated(
                        itemCount: projects.length,
                        separatorBuilder: (context, index) => SizedBox(height: 20.h),
                        itemBuilder: (context, index) {
                          Project project = projects.elementAt(index);
                          return GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () => AutoRouter.of(context).maybePop(project),
                            child: ProjectTinyItem(project: project, width: 279.w),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    },
  );
}
