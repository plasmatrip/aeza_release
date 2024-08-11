import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/internal/widgets/date_dialog.dart';
import 'package:aeza_release/app/repository/projects_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EndField extends StatelessWidget {
  const EndField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () async {
            var end = await dateDialog(context, context.read<ProjectRepo>().end);
            if (end != null && context.mounted) {
              context.read<ProjectRepo>().end = end;
            }
          },
          child: Container(
            width: 156.w,
            height: 89.h,
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
                Text(
                  'Дата окончания',
                  style: context.s14w500.copyWith(color: blue_3, height: 0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    context.watch<ProjectRepo>().end != null
                        ? Text(DateFormat('dd.MM.y', 'ru').format(context.watch<ProjectRepo>().end!), style: context.s14w400.copyWith(color: black))
                        : Text('Дата', style: context.s14w400.copyWith(color: grey_3)),
                    SvgPicture.asset('assets/icons/Calendar.svg'),
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
