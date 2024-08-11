import 'package:aeza_release/app/internal/const/boxes.dart';
import 'package:aeza_release/app/internal/enums/task_status.dart';
import 'package:aeza_release/app/models/project.dart';
import 'package:aeza_release/app/models/release.dart';
import 'package:aeza_release/app/models/task.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ProjectRepo with ChangeNotifier {
  Box repo = Hive.box<Project>(Boxes.projects);

  final Project _project = Project.create();

  bool editMode = false;
  int editKey = 0;

  String _searchString = '';
  String get searchString => _searchString;
  set searchString(String value) {
    _searchString = value;
    notifyListeners();
  }

  void clearSearchString() {
    _searchString = '';
  }

  String get name => _project.name;
  set name(String value) {
    _project.name = value;
    notifyListeners();
  }

  DateTime? get start => _project.start;
  set start(DateTime? value) {
    _project.start = value;
    notifyListeners();
  }

  DateTime? get end => _project.end;
  set end(DateTime? value) {
    _project.end = value;
    notifyListeners();
  }

  int? get status => _project.status;
  set status(int? value) {
    _project.status = value;
    notifyListeners();
  }

  String get description => _project.description;
  set description(String value) {
    _project.description = value;
    notifyListeners();
  }

  void clean() {
    _project.clean();
    editKey = 0;
    editMode = false;
  }

  Future<void> save() async {
    if (editMode) {
      Project project = repo.get(editKey);
      project.copy(_project);
      project.save();
    } else {
      Project project = Project.create(from: _project);
      repo.add(project);
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
    Project project = repo.get(key);
    for (Task task in Hive.box<Task>(Boxes.tasks).values) {
      if ((task.project!.single).key == project.key) {
        task.delete();
      }
    }
    for (Release release in Hive.box<Release>(Boxes.releases).values) {
      if ((release.project!.single).key == project.key) {
        release.delete();
      }
    }
    project.delete();
    notifyListeners();
  }

  void edit(int key) {
    _project.copy(repo.get(key));
    editMode = true;
    editKey = key;
  }

  bool canSave() {
    return _project.isNotEmpty();
  }

  int completeTasks(Project project) {
    return Hive.box<Task>(Boxes.tasks)
        .values
        .where((task) => (task.project!.single as Project).key == project.key)
        .where((task) => task.status == TaskStatus.completed.index)
        .length;
  }

  int tasks(Project project) {
    return Hive.box<Task>(Boxes.tasks).values.where((task) => (task.project!.single as Project).key == project.key).length;
  }

  double progress(Project project) {
    var countTask = tasks(project);
    if (countTask == 0) {
      return 0;
    }
    return completeTasks(project) / countTask;
  }

  Future<void> setStatus(int key, int status) async {
    Project project = repo.get(key);
    project.status = status;
    project.save();
    notifyListeners();
  }

  Iterable projects() {
    return repo.values.where((element) => _searchString.isEmpty ? true : (element as Project).name.contains(_searchString));
  }

  Iterable projectsByDate(DateTime date) {
    return repo.values.where((project) => (project as Project).end!.isAfter(date));
  }
}
