import 'dart:ui';

import 'package:aeza_release/app/internal/const/colors.dart';

enum TaskStatus {
  formulation(name: 'Постановка задачи', color: colors_1),
  completing(name: 'Выполнение задачи', color: colors_3),
  verifying(name: 'Проверка решения', color: colors_2),
  completed(name: 'Выполнено', color: colors_4);

  const TaskStatus({
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;
}
