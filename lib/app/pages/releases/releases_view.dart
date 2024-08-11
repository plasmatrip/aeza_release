import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/models/release.dart';
import 'package:aeza_release/app/pages/releases/widgets/release_item.dart';
import 'package:aeza_release/app/repository/releases_repo.dart';
import 'package:aeza_release/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class ReleasesView extends StatelessWidget {
  const ReleasesView({super.key});

  @override
  Widget build(BuildContext context) {
    Iterable releases = context.watch<ReleasesRepo>().repo.values;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16.h),
            bottomRight: Radius.circular(16.h),
          ),
        ),
        toolbarHeight: 100.h,
        backgroundColor: blue_1,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Aeza',
                        style: context.s36w700.copyWith(color: black),
                      ),
                      TextSpan(
                        text: 'Release',
                        style: context.s36w700.copyWith(color: black, fontStyle: FontStyle.italic),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () async => AutoRouter.of(context).removeLast(),
                  child: Container(
                    width: 36.h,
                    height: 36.h,
                    decoration: const ShapeDecoration(
                      color: black,
                      shape: OvalBorder(),
                    ),
                    child: Icon(Icons.close, color: bg, size: 24.h),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Text('Релизы', style: context.s22w500.copyWith(color: black)),
              ],
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h, bottom: 100.h),
        itemCount: releases.length,
        separatorBuilder: (context, index) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          Release release = releases.elementAt(index);
          return ReleaseItem(
            release: release,
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FilledButton(
        onPressed: () async => AutoRouter.of(context).push(const AddRelease()),
        style: context.extraBtn,
        child: const Text('Добавить релиз'),
      ),
    );
  }
}
