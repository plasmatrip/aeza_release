import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/pages/tasks/widgets/fields/employee_field.dart';
import 'package:aeza_release/app/repository/tasks_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class EmployeeBlock extends StatelessWidget {
  const EmployeeBlock({super.key});

  @override
  Widget build(BuildContext context) {
    var employeesCount = context.select<TaskRepo, int>((p) => p.employeeCount());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 327.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.h),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Исполнитель',
                style: context.s14w500.copyWith(color: blue_3, height: 0),
              ),
              SizedBox(height: 16.h),
              for (int i = 0; i < employeesCount; i++) ...[
                EmployeeField(index: i),
                if (i < employeesCount - 1) ...[
                  SizedBox(height: 8.h),
                ]
              ]
            ],
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
