import 'dart:ui';

import 'package:aeza_release/app/internal/const/colors.dart';

enum ReleaseStatus {
  formulation(name: 'Тестирование', color: colors_5),
  completing(name: 'Корректировка', color: colors_3),
  verifying(name: 'Развертывание', color: colors_4);

  const ReleaseStatus({
    required this.name,
    required this.color,
  });

  final String name;
  final Color color;
}
