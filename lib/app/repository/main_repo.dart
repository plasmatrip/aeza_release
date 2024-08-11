import 'package:flutter/material.dart';

enum WorkType { releases, tasks, projects }

class MainRepo with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  set selectedDate(DateTime value) {
    _selectedDate = value;
    notifyListeners();
  }

  WorkType _selectedWorkType = WorkType.releases;
  WorkType get selectedWorkType => _selectedWorkType;
  set selectedWorkType(WorkType value) {
    _selectedWorkType = value;
    notifyListeners();
  }
}
