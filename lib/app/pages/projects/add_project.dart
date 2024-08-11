import 'package:aeza_release/app/internal/const/colors.dart';
import 'package:aeza_release/app/internal/const/ui.dart';
import 'package:aeza_release/app/pages/projects/widgets/fields/description_field.dart';
import 'package:aeza_release/app/pages/projects/widgets/fields/end_field.dart';
import 'package:aeza_release/app/pages/projects/widgets/fields/name_field.dart';
import 'package:aeza_release/app/pages/projects/widgets/fields/start_field.dart';
import 'package:aeza_release/app/pages/projects/widgets/fields/status_field.dart';
import 'package:aeza_release/app/repository/projects_repo.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

@RoutePage()
class AddProject extends StatelessWidget {
  const AddProject({super.key});

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
              context.read<ProjectRepo>().clean();
              AutoRouter.of(context).maybePop(false);
            },
            child: Icon(Icons.arrow_back, color: black, size: 24.h),
          ),
          title: const Text('Добавление нового проекта'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StartField(),
                    EndField(),
                  ],
                ),
                StatusField(),
                DescriptionField(),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FilledButton(
          onPressed: context.select<ProjectRepo, bool>((p) => p.canSave())
              ? () async {
                  context.read<ProjectRepo>().save();
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
