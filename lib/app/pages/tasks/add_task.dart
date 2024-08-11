import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/pages/tasks/widgets/employee_block.dart';
import 'package:aeza_release/app/pages/tasks/widgets/fields/description_field.dart';
import 'package:aeza_release/app/pages/tasks/widgets/fields/end_date_field.dart';
import 'package:aeza_release/app/pages/tasks/widgets/fields/end_time_field.dart';
import 'package:aeza_release/app/pages/tasks/widgets/fields/name_field.dart';
import 'package:aeza_release/app/pages/tasks/widgets/fields/projects_field.dart';
import 'package:aeza_release/app/pages/tasks/widgets/fields/start_date_field.dart';
import 'package:aeza_release/app/pages/tasks/widgets/fields/start_time_field.dart';
import 'package:aeza_release/app/pages/tasks/widgets/fields/status_field.dart';
import 'package:aeza_release/app/repository/tasks_repo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: grey_1,
        appBar: AppBar(
          leading: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () async {
              context.read<TaskRepo>().clean();
              AutoRouter.of(context).maybePop(false);
            },
            child: Icon(Icons.arrow_back, color: black, size: 24.h),
          ),
          title: const Text('Добавление задачи'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16.h),
              bottomRight: Radius.circular(16.h),
            ),
          ),
          backgroundColor: blue_1,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h, bottom: 100.h),
            child: const Column(
              children: [
                NameField(),
                ProjectField(),
                StatusField(),
                EmployeeBlock(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StartDateField(),
                    StartTimeField(),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    EndDateField(),
                    EndTimeField(),
                  ],
                ),
                DescriptionField(),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FilledButton(
          onPressed: context.select<TaskRepo, bool>((p) => p.canSave())
              ? () async {
                  context.read<TaskRepo>().save();
                  AutoRouter.of(context).maybePop(true);
                }
              : null,
          style: context.extraBtn,
          child: const Text('Сохранить'),
        ),
      ),
    );
  }
}
