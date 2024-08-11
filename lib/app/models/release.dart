import 'package:hive/hive.dart';

part 'release.g.dart';

@HiveType(typeId: 3)
class Release extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime? date;

  @HiveField(2)
  DateTime? time;

  @HiveField(3)
  int? status;

  @HiveField(4)
  String description;

  @HiveField(5)
  HiveList? project;

  bool isNotEmpty() {
    return name.isNotEmpty && date != null && time != null && status != null && project != null && description.isNotEmpty;
  }

  void copy(Release release) {
    name = release.name;
    date = release.date;
    time = release.time;
    project = release.project;
    status = release.status;
    description = release.description;
  }

  static Release create({Release? from}) {
    if (from != null) {
      return Release(
        name: from.name,
        date: from.date,
        time: from.time,
        status: from.status,
        description: from.description,
        project: from.project,
      );
    }
    return Release(name: '', description: '');
  }

  void clean() {
    name = '';
    date = null;
    time = null;
    project = null;
    status = null;
    description = '';
  }

  Release({
    required this.name,
    required this.description,
    this.project,
    this.date,
    this.time,
    this.status,
  });
}
