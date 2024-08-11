import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/repository/tasks_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class DescriptionField extends StatefulWidget {
  const DescriptionField({
    super.key,
  });

  @override
  State<DescriptionField> createState() => _DescriptionFieldState();
}

class _DescriptionFieldState extends State<DescriptionField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: context.read<TaskRepo>().description);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
              Text(
                'Описание',
                style: context.s14w500.copyWith(color: blue_3, height: 0),
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: controller,
                onChanged: (value) => context.read<TaskRepo>().description = value,
                style: context.s14w400.copyWith(color: black),
                minLines: 3,
                maxLines: 12,
                decoration: InputDecoration.collapsed(
                  border: InputBorder.none,
                  hintText: 'Описание задачи',
                  hintStyle: context.s14w400.copyWith(color: grey_3),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
