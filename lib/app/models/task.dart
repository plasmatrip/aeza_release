import 'package:hive/hive.dart';

part 'task.g.dart';

@HiveType(typeId: 2)
class Task extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime? startDate;

  @HiveField(2)
  DateTime? endDate;

  @HiveField(3)
  DateTime? startTime;

  @HiveField(4)
  DateTime? endTime;

  @HiveField(5)
  int? status;

  @HiveField(6)
  String description;

  @HiveField(7)
  List<String> employees;

  @HiveField(8)
  HiveList? project;

  bool isNotEmpty() {
    return name.isNotEmpty &&
        startDate != null &&
        endDate != null &&
        startTime != null &&
        endTime != null &&
        employees.isNotEmpty &&
        status != null &&
        project != null &&
        description.isNotEmpty;
  }

  void copy(Task task) {
    name = task.name;
    startDate = task.startDate;
    endDate = task.endDate;
    startTime = task.startTime;
    endTime = task.endTime;
    employees = task.employees;
    project = task.project;
    status = task.status;
    description = task.description;
  }

  static Task create({Task? from}) {
    if (from != null) {
      return Task(
        name: from.name,
        startDate: from.startDate,
        endDate: from.endDate,
        startTime: from.startTime,
        endTime: from.endTime,
        status: from.status,
        description: from.description,
        employees: from.employees,
        project: from.project,
      );
    }
    return Task(name: '', description: '', employees: ['']);
  }

  void clean() {
    name = '';
    startDate = null;
    endDate = null;
    startTime = null;
    endTime = null;
    employees = [''];
    project = null;
    status = null;
    description = '';
  }

  Task({
    required this.name,
    required this.description,
    required this.employees,
    this.project,
    this.startDate,
    this.endDate,
    this.startTime,
    this.endTime,
    this.status,
  });
}
