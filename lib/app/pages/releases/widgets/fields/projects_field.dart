import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/widgets/project_tiny_item.dart';
import 'package:aeza_release/app/internal/widgets/projects_dialog.dart';
import 'package:aeza_release/app/models/project.dart';
import 'package:aeza_release/app/repository/releases_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProjectField extends StatelessWidget {
  const ProjectField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    Project? project = context.select<ReleasesRepo, Project?>((p) => p.project);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            var project = await projectsDialog(context);
            if (project != null && context.mounted) {
              context.read<ReleasesRepo>().project = project;
            }
          },
          child: Container(
            key: globalKey,
            width: 327.w,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Проект',
                      style: context.s14w500.copyWith(color: blue_3, height: 0),
                    ),
                    if (project != null) ...[
                      SvgPicture.asset('assets/icons/Notes Minimalistic.svg', width: 24.w, height: 24.h),
                    ]
                  ],
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (project == null) ...[
                      Text('Выберите проект', style: context.s14w400.copyWith(color: grey_3)),
                      SvgPicture.asset('assets/icons/Notes Minimalistic.svg', width: 24.w, height: 24.h),
                    ] else ...[
                      ProjectTinyItem(project: project, width: 295.w),
                    ],
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
