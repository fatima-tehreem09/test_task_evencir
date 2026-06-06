import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task_evencir/core/router/app_routes.dart';
import 'package:test_task_evencir/core/theme/colors.dart';
import 'package:test_task_evencir/shared/widgets/app_bottom_nav_bar.dart';

class ShellRouteWrapper extends StatelessWidget {
  const ShellRouteWrapper({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  int _indexFromLocation(String location) {
    if (location == AppRoutes.nutritionPath) return 0;
    if (location == AppRoutes.planPath) return 1;
    if (location == AppRoutes.moodPath) return 2;
    if (location == AppRoutes.profilePath) return 3;
    return navigationShell.currentIndex;
  }

  void _onItemTapped(int index) {
    if (index != navigationShell.currentIndex) {
      navigationShell.goBranch(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    final currentIndex = _indexFromLocation(location);
    final shouldShowBottomNav = AppRoutes.shellPaths.contains(location);

    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: navigationShell,
      bottomNavigationBar: shouldShowBottomNav
          ? AppBottomNavBar(currentIndex: currentIndex, onTap: _onItemTapped)
          : null,
    );
  }
}
