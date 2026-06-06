import 'package:flutter/material.dart';
import 'package:test_task_evencir/core/theme/app_text_styles.dart';
import 'package:test_task_evencir/core/theme/colors.dart';
import 'package:test_task_evencir/core/utils/date_time_utils.dart';
import 'package:test_task_evencir/core/utils/extensions.dart';
import 'package:test_task_evencir/features/nutrition/presentation/widgets/calendar_strip.dart';
import 'package:test_task_evencir/features/nutrition/presentation/widgets/insights_section.dart';
import 'package:test_task_evencir/features/nutrition/presentation/widgets/nutrition_top_bar.dart';
import 'package:test_task_evencir/features/nutrition/presentation/widgets/workouts_section.dart';

class NutritionPage extends StatefulWidget {
  const NutritionPage({super.key});

  @override
  State<NutritionPage> createState() => _NutritionPageState();
}

class _NutritionPageState extends State<NutritionPage> {
  int _selectedDateIndex = 1;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const NutritionTopBar(),
              24.heightBox,
              Text(DateTimeUtils.todayHeader, style: theme.bold16),
              16.heightBox,
              CalendarStrip(
                selectedIndex: _selectedDateIndex,
                onDateSelected: (index) {
                  setState(() => _selectedDateIndex = index);
                },
              ),
              16.heightBox,
              Center(
                child: Container(
                  width: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusGeometry.circular(40),
                    color: AppColors.primaryCharcoal,
                    border: Border.all(
                      color: AppColors.primaryCharcoal,
                      width: 5,
                    ),
                  ),
                ),
              ),
              24.heightBox,
              const WorkoutsSection(),
              32.heightBox,
              const InsightsSection(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
