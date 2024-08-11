import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/repository/main_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class WorkTypeSelector extends StatelessWidget {
  const WorkTypeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var workTypeSelect = context.select<MainRepo, WorkType>((p) => p.selectedWorkType);
    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.read<MainRepo>().selectedWorkType = WorkType.releases,
          child: Container(
            height: 24.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: ShapeDecoration(
              color: workTypeSelect == WorkType.releases ? blue_2 : grey_2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Startup.svg',
                  width: 16.w,
                  height: 16.h,
                  colorFilter: ColorFilter.mode(workTypeSelect == WorkType.releases ? bg : grey_3, BlendMode.srcIn),
                ),
                SizedBox(width: 4.w),
                Text(
                  'Релизы',
                  style: context.s12w400.copyWith(color: workTypeSelect == WorkType.releases ? bg : grey_3),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.read<MainRepo>().selectedWorkType = WorkType.tasks,
          child: Container(
            height: 24.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: ShapeDecoration(
              color: workTypeSelect == WorkType.tasks ? blue_2 : grey_2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/Gear.svg',
                  width: 16.w,
                  height: 16.h,
                  colorFilter: ColorFilter.mode(workTypeSelect == WorkType.tasks ? bg : grey_3, BlendMode.srcIn),
                ),
                SizedBox(width: 4.w),
                Text(
                  'Задачи',
                  style: context.s12w400.copyWith(color: workTypeSelect == WorkType.tasks ? bg : grey_3),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => context.read<MainRepo>().selectedWorkType = WorkType.projects,
          child: Container(
            height: 24.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: ShapeDecoration(
              color: workTypeSelect == WorkType.projects ? blue_2 : grey_2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/bag.svg',
                  width: 16.w,
                  height: 16.h,
                  colorFilter: ColorFilter.mode(workTypeSelect == WorkType.projects ? bg : grey_3, BlendMode.srcIn),
                ),
                SizedBox(width: 4.w),
                Text(
                  'Проекты',
                  style: context.s12w400.copyWith(color: workTypeSelect == WorkType.projects ? bg : grey_3),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
