import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/models/project.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class ProjectTinyItem extends StatelessWidget {
  const ProjectTinyItem({
    required this.project,
    required this.width,
    super.key,
  });

  final Project project;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 87.h,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: ShapeDecoration(
        color: grey_1,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: grey_2),
          borderRadius: BorderRadius.circular(16.h),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            project.name,
            style: context.s18w500.copyWith(color: black),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            width: 247.w,
            height: 25.h,
            padding: EdgeInsets.only(top: 4.h, left: 8.w, bottom: 4.h),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(width: 1.w, color: blue_2),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                SvgPicture.asset('assets/icons/Rocket 2.svg', width: 17.w, height: 17.h),
                SizedBox(width: 4.w),
                Text(DateFormat('dd.MM.y', 'ru').format(project.start!), style: context.s14w400),
                const Spacer(),
                SvgPicture.asset('assets/icons/Rocket.svg', width: 17.w, height: 17.h),
                SizedBox(width: 4.w),
                Text(DateFormat('dd.MM.y', 'ru').format(project.end!), style: context.s14w400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
