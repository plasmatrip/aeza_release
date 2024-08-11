import 'package:hive/hive.dart';

part 'project.g.dart';

@HiveType(typeId: 1)
class Project extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime? start;

  @HiveField(2)
  DateTime? end;

  @HiveField(3)
  int? status;

  @HiveField(4)
  String description;

  @HiveField(5)
  HiveList? tasks;

  bool isNotEmpty() {
    return name.isNotEmpty && start != null && end != null && status != null && description.isNotEmpty;
  }

  void copy(Project project) {
    name = project.name;
    start = project.start;
    end = project.end;
    status = project.status;
    description = project.description;
    tasks = project.tasks;
  }

  static Project create({Project? from}) {
    if (from != null) {
      return Project(
        name: from.name,
        start: from.start,
        end: from.end,
        status: from.status,
        description: from.description,
        tasks: from.tasks,
      );
    }
    return Project(name: '', description: '');
  }

  void clean() {
    name = '';
    start = null;
    end = null;
    status = null;
    description = '';
    tasks = null;
  }

  Project({
    required this.name,
    required this.description,
    this.start,
    this.end,
    this.status,
    this.tasks,
  });
}
