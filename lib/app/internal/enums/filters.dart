enum Filters {
  formulation(name: 'Постановка задачи'),
  completing(name: 'Выполнение задачи'),
  verifying(name: 'Проверка решения'),
  completed(name: 'Выполнено'),
  all(name: 'Все');

  const Filters({
    required this.name,
  });

  final String name;
}
