import 'package:flutter/material.dart';
import 'package:test_task_evencir/core/constants/app_constants.dart';
import 'package:test_task_evencir/core/router/app_router.dart';
import 'package:test_task_evencir/core/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child!,
        );
      },
      title: AppConstants.appName,
      theme: AppTheme.dark,
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
