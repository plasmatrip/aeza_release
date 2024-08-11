// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aeza_release/app/pages/main_navigation/main_navigation.dart'
    as _i4;
import 'package:aeza_release/app/pages/onboarding/onboarding_view.dart' as _i5;
import 'package:aeza_release/app/pages/projects/add_project.dart' as _i1;
import 'package:aeza_release/app/pages/projects/projects_view.dart' as _i6;
import 'package:aeza_release/app/pages/projects/selected_project_view.dart'
    as _i8;
import 'package:aeza_release/app/pages/releases/add_release.dart' as _i2;
import 'package:aeza_release/app/pages/releases/releases_view.dart' as _i7;
import 'package:aeza_release/app/pages/releases/selected_release_view.dart'
    as _i9;
import 'package:aeza_release/app/pages/settings/settings_view.dart' as _i11;
import 'package:aeza_release/app/pages/spalsh/splash_view.dart' as _i12;
import 'package:aeza_release/app/pages/tasks/add_task.dart' as _i3;
import 'package:aeza_release/app/pages/tasks/selected_task_view.dart' as _i10;
import 'package:aeza_release/app/pages/tasks/tasks_view.dart' as _i13;
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;

/// generated route for
/// [_i1.AddProject]
class AddProject extends _i14.PageRouteInfo<void> {
  const AddProject({List<_i14.PageRouteInfo>? children})
      : super(
          AddProject.name,
          initialChildren: children,
        );

  static const String name = 'AddProject';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddProject();
    },
  );
}

/// generated route for
/// [_i2.AddRelease]
class AddRelease extends _i14.PageRouteInfo<void> {
  const AddRelease({List<_i14.PageRouteInfo>? children})
      : super(
          AddRelease.name,
          initialChildren: children,
        );

  static const String name = 'AddRelease';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddRelease();
    },
  );
}

/// generated route for
/// [_i3.AddTask]
class AddTask extends _i14.PageRouteInfo<void> {
  const AddTask({List<_i14.PageRouteInfo>? children})
      : super(
          AddTask.name,
          initialChildren: children,
        );

  static const String name = 'AddTask';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i3.AddTask();
    },
  );
}

/// generated route for
/// [_i4.MainNavigation]
class MainNavigation extends _i14.PageRouteInfo<void> {
  const MainNavigation({List<_i14.PageRouteInfo>? children})
      : super(
          MainNavigation.name,
          initialChildren: children,
        );

  static const String name = 'MainNavigation';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i4.MainNavigation();
    },
  );
}

/// generated route for
/// [_i5.OnBoardingView]
class OnBoardingView extends _i14.PageRouteInfo<void> {
  const OnBoardingView({List<_i14.PageRouteInfo>? children})
      : super(
          OnBoardingView.name,
          initialChildren: children,
        );

  static const String name = 'OnBoardingView';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i5.OnBoardingView();
    },
  );
}

/// generated route for
/// [_i6.ProjectsView]
class ProjectsView extends _i14.PageRouteInfo<void> {
  const ProjectsView({List<_i14.PageRouteInfo>? children})
      : super(
          ProjectsView.name,
          initialChildren: children,
        );

  static const String name = 'ProjectsView';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProjectsView();
    },
  );
}

/// generated route for
/// [_i7.ReleasesView]
class ReleasesView extends _i14.PageRouteInfo<void> {
  const ReleasesView({List<_i14.PageRouteInfo>? children})
      : super(
          ReleasesView.name,
          initialChildren: children,
        );

  static const String name = 'ReleasesView';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.ReleasesView();
    },
  );
}

/// generated route for
/// [_i8.SelectedProjectView]
class SelectedProjectView extends _i14.PageRouteInfo<SelectedProjectViewArgs> {
  SelectedProjectView({
    required int projectKey,
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SelectedProjectView.name,
          args: SelectedProjectViewArgs(
            projectKey: projectKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedProjectView';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelectedProjectViewArgs>();
      return _i8.SelectedProjectView(
        projectKey: args.projectKey,
        key: args.key,
      );
    },
  );
}

class SelectedProjectViewArgs {
  const SelectedProjectViewArgs({
    required this.projectKey,
    this.key,
  });

  final int projectKey;

  final _i15.Key? key;

  @override
  String toString() {
    return 'SelectedProjectViewArgs{projectKey: $projectKey, key: $key}';
  }
}

/// generated route for
/// [_i9.SelectedReleaseView]
class SelectedReleaseView extends _i14.PageRouteInfo<SelectedReleaseViewArgs> {
  SelectedReleaseView({
    required int releaseKey,
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SelectedReleaseView.name,
          args: SelectedReleaseViewArgs(
            releaseKey: releaseKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedReleaseView';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelectedReleaseViewArgs>();
      return _i9.SelectedReleaseView(
        releaseKey: args.releaseKey,
        key: args.key,
      );
    },
  );
}

class SelectedReleaseViewArgs {
  const SelectedReleaseViewArgs({
    required this.releaseKey,
    this.key,
  });

  final int releaseKey;

  final _i15.Key? key;

  @override
  String toString() {
    return 'SelectedReleaseViewArgs{releaseKey: $releaseKey, key: $key}';
  }
}

/// generated route for
/// [_i10.SelectedTaskView]
class SelectedTaskView extends _i14.PageRouteInfo<SelectedTaskViewArgs> {
  SelectedTaskView({
    required int taskKey,
    _i15.Key? key,
    List<_i14.PageRouteInfo>? children,
  }) : super(
          SelectedTaskView.name,
          args: SelectedTaskViewArgs(
            taskKey: taskKey,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SelectedTaskView';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SelectedTaskViewArgs>();
      return _i10.SelectedTaskView(
        taskKey: args.taskKey,
        key: args.key,
      );
    },
  );
}

class SelectedTaskViewArgs {
  const SelectedTaskViewArgs({
    required this.taskKey,
    this.key,
  });

  final int taskKey;

  final _i15.Key? key;

  @override
  String toString() {
    return 'SelectedTaskViewArgs{taskKey: $taskKey, key: $key}';
  }
}

/// generated route for
/// [_i11.SettingsView]
class SettingsView extends _i14.PageRouteInfo<void> {
  const SettingsView({List<_i14.PageRouteInfo>? children})
      : super(
          SettingsView.name,
          initialChildren: children,
        );

  static const String name = 'SettingsView';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.SettingsView();
    },
  );
}

/// generated route for
/// [_i12.SplashView]
class SplashView extends _i14.PageRouteInfo<void> {
  const SplashView({List<_i14.PageRouteInfo>? children})
      : super(
          SplashView.name,
          initialChildren: children,
        );

  static const String name = 'SplashView';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashView();
    },
  );
}

/// generated route for
/// [_i13.TasksView]
class TasksView extends _i14.PageRouteInfo<void> {
  const TasksView({List<_i14.PageRouteInfo>? children})
      : super(
          TasksView.name,
          initialChildren: children,
        );

  static const String name = 'TasksView';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.TasksView();
    },
  );
}
