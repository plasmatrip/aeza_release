import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/enums/release_status.dart';
import 'package:aeza_release/app/internal/widgets/delete_dalog.dart';
import 'package:aeza_release/app/internal/widgets/edit_delete_dialog.dart';
import 'package:aeza_release/app/internal/widgets/status_dialog.dart';
import 'package:aeza_release/app/models/project.dart';
import 'package:aeza_release/app/models/release.dart';
import 'package:aeza_release/app/repository/releases_repo.dart';
import 'package:aeza_release/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ReleaseItem extends StatelessWidget {
  const ReleaseItem({
    required this.release,
    super.key,
  });

  final Release release;

  @override
  Widget build(BuildContext context) {
    final GlobalKey globalKey = GlobalKey();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () async => AutoRouter.of(context).push(SelectedReleaseView(releaseKey: release.key)),
      child: Container(
        width: 327.w,
        height: 104.h,
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
                color: ReleaseStatus.values[release.status!].color,
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
                  mainAxisSize: MainAxisSize.max,
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
                              color: ReleaseStatus.values[release.status!].color,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16.h),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                ReleaseStatus.values[release.status!].name,
                                style: context.s8w400.copyWith(color: black),
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
                            release.name,
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
                                    title: 'Выберите статус релиза',
                                    values: ReleaseStatus.values,
                                  );
                                  if (result != null && context.mounted) {
                                    context.read<ReleasesRepo>().setStatus(release.key, result);
                                  }
                                case 'EDIT':
                                  context.read<ReleasesRepo>().edit(release.key);
                                  AutoRouter.of(context).push(const AddRelease());
                                case 'DELETE':
                                  var result = await deleteDialog(context, 'Хотите удалить релиз?');
                                  if (result == 'DELETE' && context.mounted) {
                                    context.read<ReleasesRepo>().delete(key: release.key);
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
                    Text((release.project!.single as Project).name, style: context.s14w500.copyWith(color: grey_3)),
                    const Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 166.w,
                          child: LinearProgressIndicator(
                            value: context.read<ReleasesRepo>().progress(release),
                            color: ReleaseStatus.values[release.status!].color,
                            backgroundColor: grey_2,
                          ),
                        ),
                        const Spacer(),
                        SvgPicture.asset('assets/icons/Rocket.svg', width: 12.w, height: 12.h),
                        SizedBox(width: 4.w),
                        Text(
                          '${DateFormat('HH:mm', 'ru').format(release.time!)}, ${DateFormat('dd.MM.y', 'ru').format(release.date!)}',
                          style: context.s10w400.copyWith(color: black),
                        )
                      ],
                    ),
                    SizedBox(height: 16.h),
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
