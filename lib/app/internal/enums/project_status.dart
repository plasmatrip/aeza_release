import 'dart:ui';

import 'package:aeza_release/app/internal/const/colors.dart';

enum ProjectStatus {
  birth(name: 'Зарождение', color: colors_1, textColor: bg),
  design(name: 'Проектирование', color: colors_2, textColor: black),
  development(name: 'Разработка', color: colors_3, textColor: bg),
  stabilization(name: 'Стабилизация', color: colors_4, textColor: black),
  release(name: 'Релиз', color: colors_5, textColor: black);

  const ProjectStatus({
    required this.name,
    required this.color,
    required this.textColor,
  });

  final String name;
  final Color color;
  final Color textColor;
}
