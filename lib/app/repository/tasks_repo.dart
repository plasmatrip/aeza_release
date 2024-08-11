import 'package:aeza_release/app/internal/const/boxes.dart';
import 'package:aeza_release/app/internal/enums/filters.dart';
import 'package:aeza_release/app/models/project.dart';
import 'package:aeza_release/app/models/task.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';

class TaskRepo with ChangeNotifier {
  Box repo = Hive.box<Task>(Boxes.tasks);

  final Task _task = Task.create();

  bool editMode = false;
  int editKey = 0;

  int _filter = Filters.all.index;
  int get filter => _filter;
  set filter(int value) {
    _filter = value;
    notifyListeners();
  }

  String get name => _task.name;
  set name(String value) {
    _task.name = value;
    notifyListeners();
  }

  DateTime? get startDate => _task.startDate;
  set startDate(DateTime? value) {
    _task.startDate = value;
    notifyListeners();
  }

  DateTime? get endDate => _task.endDate;
  set endDate(DateTime? value) {
    _task.endDate = value;
    notifyListeners();
  }

  DateTime? get startTime => _task.startTime;
  set startTime(DateTime? value) {
    _task.startTime = value;
    notifyListeners();
  }

  DateTime? get endTime => _task.endTime;
  set endTime(DateTime? value) {
    _task.endTime = value;
    notifyListeners();
  }

  int? get status => _task.status;
  set status(int? value) {
    _task.status = value;
    notifyListeners();
  }

  String get description => _task.description;
  set description(String value) {
    _task.description = value;
    notifyListeners();
  }

  Project? get project => _task.project != null ? _task.project!.single as Project : null;
  set project(Project? project) {
    _task.project ??= HiveList(Hive.box<Project>(Boxes.projects));
    _task.project!.clear();
    _task.project!.add(project!);
    notifyListeners();
  }

  void addEmployee() {
    if (_task.employees.isNotEmpty) {
      if (_task.employees.last.isNotEmpty) {
        _task.employees.add('');
        notifyListeners();
      }
    }
  }

  void setEmployee(int index, String value) {
    _task.employees[index] = value;
    notifyListeners();
  }

  String getEmployee(int index) {
    return _task.employees[index];
  }

  int employeeCount() {
    return _task.employees.length;
  }

  void clean() {
    _task.clean();
    editKey = 0;
    editMode = false;
  }

  Future<void> save() async {
    if (editMode) {
      Task task = repo.get(editKey);
      task.copy(_task);
      task.save();
    } else {
      Task task = Task.create(from: _task);
      repo.add(task);
    }
    clean();
    notifyListeners();
  }

  Future<void> delete({int? key}) async {
    if (key == null) {
      if (editMode) {
        key = editKey;
      } else {
        return;
      }
    }
    Task task = repo.get(key);
    task.delete();
    notifyListeners();
  }

  void edit(int key) {
    _task.copy(repo.get(key));
    editMode = true;
    editKey = key;
  }

  bool canSave() {
    return _task.isNotEmpty();
  }

  Future<void> setStatus(int key, int status) async {
    Task task = repo.get(key);
    task.status = status;
    task.save();
    notifyListeners();
  }

  double progress(Task task) {
    DateTime ds = task.startDate!;
    DateTime ts = task.startTime!;
    DateTime de = task.endDate!;
    DateTime te = task.endTime!;
    DateTime dtStart = DateTime(ds.year, ds.month, ds.day, ts.hour, ts.minute);
    DateTime dtEnd = DateTime(de.year, de.month, de.day, te.hour, te.minute);
    Jiffy start = Jiffy.parseFromDateTime(dtStart);
    Jiffy end = Jiffy.parseFromDateTime(dtEnd);
    if (Jiffy.now().isAfter(end)) {
      return 1;
    }
    num realised = end.diff(start, unit: Unit.hour);
    if (realised <= 0) {
      return 1;
    }
    num expired = Jiffy.now().diff(start, unit: Unit.hour);
    return expired / realised;
  }

  Iterable tasks() {
    return repo.values.where((element) => _filter == Filters.all.index
        ? true
        : (element as Task).status == filter
            ? true
            : false);
  }

  Iterable tasksByDate(DateTime date) {
    return repo.values.where((task) => (task as Task).endDate!.isAfter(date));
  }
}
