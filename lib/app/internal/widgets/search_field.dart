import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/repository/projects_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SearchField extends StatefulWidget {
  const SearchField({
    super.key,
  });

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: context.read<ProjectRepo>().searchString);
    super.initState();
  }

  @override
  void deactivate() {
    context.read<ProjectRepo>().clearSearchString();
    super.deactivate();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 279.w,
      height: 32.h,
      padding: EdgeInsets.only(left: 16.w),
      decoration: ShapeDecoration(
        color: grey_1,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1.w, color: grey_2),
          borderRadius: BorderRadius.circular(16.h),
        ),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        onChanged: (value) => context.read<ProjectRepo>().searchString = value,
        style: context.s14w400.copyWith(color: black),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Искать',
          hintStyle: context.s14w400.copyWith(color: grey_3),
          suffixIcon: SvgPicture.asset(
            'assets/icons/Minimalistic Magnifer.svg',
            width: 24.h,
            height: 24.h,
            fit: BoxFit.none,
          ),
        ),
      ),
    );
  }
}
