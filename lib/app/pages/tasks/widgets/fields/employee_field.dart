import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/repository/tasks_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class EmployeeField extends StatefulWidget {
  const EmployeeField({
    required this.index,
    super.key,
  });

  final int index;

  @override
  State<EmployeeField> createState() => _EmployeeFieldState();
}

class _EmployeeFieldState extends State<EmployeeField> {
  late TextEditingController controller;
  late FocusNode focusNode;

  @override
  void initState() {
    controller = TextEditingController(text: context.read<TaskRepo>().getEmployee(widget.index));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            onChanged: (value) => context.read<TaskRepo>().setEmployee(widget.index, value),
            style: context.s14w400.copyWith(color: black),
            decoration: InputDecoration.collapsed(
              border: InputBorder.none,
              hintText: 'Фамилия и имя',
              hintStyle: context.s14w400.copyWith(color: grey_3),
            ),
          ),
        ),
        if (widget.index == context.select<TaskRepo, int>((p) => p.employeeCount() - 1)) ...[
          SizedBox(width: 12.w),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => context.read<TaskRepo>().addEmployee(),
            child: SvgPicture.asset('assets/icons/User Plus Rounded.svg', width: 24.w, height: 24.h),
          ),
        ],
      ],
    );
  }
}
