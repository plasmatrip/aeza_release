import 'package:aeza_release/app/routing/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: "Route,Page|Screen")
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: SplashView.page),
        AutoRoute(page: OnBoardingView.page),
        AutoRoute(page: MainNavigation.page),
        AutoRoute(page: SettingsView.page),
        AutoRoute(page: ProjectsView.page),
        AutoRoute(page: AddProject.page),
        AutoRoute(page: SelectedProjectView.page),
        AutoRoute(page: TasksView.page),
        AutoRoute(page: AddTask.page),
        AutoRoute(page: SelectedTaskView.page),
        AutoRoute(page: ReleasesView.page),
        AutoRoute(page: AddRelease.page),
        AutoRoute(page: SelectedReleaseView.page),
      ];
}
