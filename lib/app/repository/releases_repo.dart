import 'package:aeza_release/app/internal/const/boxes.dart';
import 'package:aeza_release/app/models/project.dart';
import 'package:aeza_release/app/models/release.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:jiffy/jiffy.dart';

class ReleasesRepo with ChangeNotifier {
  Box repo = Hive.box<Release>(Boxes.releases);

  final Release _release = Release.create();

  bool editMode = false;
  int editKey = 0;

  String get name => _release.name;
  set name(String value) {
    _release.name = value;
    notifyListeners();
  }

  DateTime? get date => _release.date;
  set date(DateTime? value) {
    _release.date = value;
    notifyListeners();
  }

  DateTime? get time => _release.time;
  set time(DateTime? value) {
    _release.time = value;
    notifyListeners();
  }

  int? get status => _release.status;
  set status(int? value) {
    _release.status = value;
    notifyListeners();
  }

  String get description => _release.description;
  set description(String value) {
    _release.description = value;
    notifyListeners();
  }

  Project? get project => _release.project != null ? _release.project!.single as Project : null;
  set project(Project? project) {
    _release.project ??= HiveList(Hive.box<Project>(Boxes.projects));
    _release.project!.clear();
    _release.project!.add(project!);
    notifyListeners();
  }

  void clean() {
    _release.clean();
    editKey = 0;
    editMode = false;
  }

  Future<void> save() async {
    if (editMode) {
      Release release = repo.get(editKey);
      release.copy(_release);
      release.save();
    } else {
      Release release = Release.create(from: _release);
      repo.add(release);
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
    Release release = repo.get(key);
    release.delete();
    notifyListeners();
  }

  void edit(int key) {
    _release.copy(repo.get(key));
    editMode = true;
    editKey = key;
  }

  bool canSave() {
    return _release.isNotEmpty();
  }

  Future<void> setStatus(int key, int status) async {
    Release release = repo.get(key);
    release.status = status;
    release.save();
    notifyListeners();
  }

  double progress(Release release) {
    DateTime ds = (release.project!.single as Project).start!;
    DateTime de = release.date!;
    DateTime te = release.time!;
    DateTime dtStart = DateTime(ds.year, ds.month, ds.day);
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

  Iterable releasesByDate(DateTime date) {
    return repo.values.where((release) => (release as Release).date!.isAfter(date));
  }
}
