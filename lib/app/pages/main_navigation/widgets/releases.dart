import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/repository/releases_repo.dart';
import 'package:aeza_release/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

class Releases extends StatelessWidget {
  const Releases({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async => AutoRouter.of(context).push(const ReleasesView()),
      child: Container(
        width: 156.w,
        height: 144.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: ShapeDecoration(
          color: blue_4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.h),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset('assets/icons/Startup.svg', width: 49.w, height: 48.h),
            const Spacer(),
            Text('Релизы', style: context.s22w500.copyWith(color: black, height: 0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ValueListenableBuilder(
                  valueListenable: context.read<ReleasesRepo>().repo.listenable(),
                  builder: (context, repo, child) => Text(
                    '${repo.length} релиза',
                    style: context.s14w400.copyWith(color: grey_3),
                  ),
                ),
                SvgPicture.asset('assets/icons/Arrow Right.svg'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
