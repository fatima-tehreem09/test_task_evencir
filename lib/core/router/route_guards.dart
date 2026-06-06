import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task_evencir/core/router/app_routes.dart';

abstract final class RouteGuards {
  static String? authGuard(BuildContext context, GoRouterState state) {
    final location = state.matchedLocation;

    if (location == '/') {
      return AppRoutes.initialTabPath;
    }

    if (AppRoutes.shellPaths.contains(location)) {
      return null;
    }

    return AppRoutes.initialTabPath;
  }
}
