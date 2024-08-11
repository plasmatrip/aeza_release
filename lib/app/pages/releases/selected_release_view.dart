import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/enums/release_status.dart';
import 'package:aeza_release/app/internal/widgets/status_dialog.dart';
import 'package:aeza_release/app/models/release.dart';
import 'package:aeza_release/app/repository/releases_repo.dart';
import 'package:aeza_release/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SelectedReleaseView extends StatelessWidget {
  const SelectedReleaseView({required this.releaseKey, super.key});

  final int releaseKey;

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    Release release = context.watch<ReleasesRepo>().repo.get(releaseKey);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async => AutoRouter.of(context).removeLast(),
          child: Icon(Icons.arrow_back, color: black, size: 24.h),
        ),
        title: Text(release.name),
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
              context.read<ReleasesRepo>().edit(release.key);
              AutoRouter.of(context).push(const AddRelease());
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
                side: BorderSide(width: 1.w, color: grey_2),
                borderRadius: BorderRadius.circular(16.h),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Проект', style: context.s14w500.copyWith(color: grey_3)),
                    SizedBox(
                      width: 233.w,
                      child: Text(
                        release.name,
                        style: context.s18w500.copyWith(color: black),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h),
                Container(
                  width: 295.w,
                  height: 64.h,
                  padding: EdgeInsets.only(top: 4.h, left: 8.w, bottom: 4.h),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(width: 1.w, color: blue_2),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/icons/Calendar.svg', width: 24.w, height: 24.h),
                          Text(DateFormat('dd.MM.y', 'ru').format(release.date!), style: context.s14w400.copyWith(color: black)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset('assets/icons/Clock Circle.svg', width: 24.w, height: 24.h),
                          Text(DateFormat('HH:mm', 'ru').format(release.time!), style: context.s14w400.copyWith(color: black)),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async {
                    var status = await statusDialog(
                      context: context,
                      globalKey: globalKey,
                      title: 'Выберите статус задачи',
                      values: ReleaseStatus.values,
                    );
                    if (status != null && context.mounted) {
                      context.read<ReleasesRepo>().setStatus(release.key, status);
                    }
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Статус релиза', style: context.s14w400.copyWith(color: grey_3)),
                      const Spacer(),
                      Text(ReleaseStatus.values[release.status!].name, style: context.s14w400.copyWith(color: black)),
                      SizedBox(width: 8.w),
                      SvgPicture.asset(
                        key: globalKey,
                        'assets/icons/Alt Arrow Down.svg',
                        width: 24.w,
                        height: 24.h,
                      ),
                    ],
                  ),
                ),
                Divider(color: grey_2, thickness: 0.5.h, height: 32.h),
                Text(release.description, style: context.s14w400.copyWith(color: black)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
