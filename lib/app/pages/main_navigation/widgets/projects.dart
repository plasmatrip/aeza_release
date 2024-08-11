import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/repository/projects_repo.dart';
import 'package:aeza_release/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Projects extends StatelessWidget {
  const Projects({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async => AutoRouter.of(context).push(const ProjectsView()),
      child: Container(
        width: 327.w,
        height: 144.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: ShapeDecoration(
          color: blue_1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.h),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/bag.svg', width: 50.w, height: 48.h),
            const Spacer(),
            Text('Проекты', style: context.s22w500.copyWith(color: black, height: 0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${context.watch<ProjectRepo>().repo.length} проектов', style: context.s14w400.copyWith(color: grey_3)),
                Icon(Icons.arrow_forward, color: black, size: 24.h),
              ],
            )
          ],
        ),
      ),
    );
  }
}
