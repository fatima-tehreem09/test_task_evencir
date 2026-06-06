import 'package:flutter/material.dart';
import 'package:test_task_evencir/core/theme/colors.dart';

abstract final class AppTheme {
  static ThemeData get dark => ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Mulish',
        scaffoldBackgroundColor: AppColors.primaryBlack,
        colorScheme: const ColorScheme.dark(
          surface: AppColors.primaryBlack,
          onSurface: AppColors.primaryWhite,
        ),
        useMaterial3: true,
      );
}
