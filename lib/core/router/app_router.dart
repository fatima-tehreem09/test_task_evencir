import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task_evencir/core/router/app_routes.dart';
import 'package:test_task_evencir/core/router/route_guards.dart';
import 'package:test_task_evencir/core/router/shell_route_wrapper.dart';
import 'package:test_task_evencir/features/mood/presentation/pages/mood_page.dart';
import 'package:test_task_evencir/features/nutrition/presentation/pages/nutrition_page.dart';
import 'package:test_task_evencir/features/plan/presentation/pages/plan_page.dart';
import 'package:test_task_evencir/features/profile/presentation/pages/profile_page.dart';

abstract final class AppRouter {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.initialTabPath,
    debugLogDiagnostics: true,
    redirect: RouteGuards.authGuard,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ShellRouteWrapper(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.nutritionPath,
                name: AppRoutes.nutritionName,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: NutritionPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.planPath,
                name: AppRoutes.planName,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: PlanPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.moodPath,
                name: AppRoutes.moodName,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: MoodPage()),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profilePath,
                name: AppRoutes.profileName,
                pageBuilder: (context, state) =>
                    const NoTransitionPage(child: ProfilePage()),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Error: ${state.error}'))),
  );
}
