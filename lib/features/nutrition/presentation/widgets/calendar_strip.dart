import 'package:flutter/material.dart';
import 'package:test_task_evencir/core/theme/app_text_styles.dart';
import 'package:test_task_evencir/core/theme/colors.dart';
import 'package:test_task_evencir/core/utils/extensions.dart';

class CalendarStrip extends StatelessWidget {
  const CalendarStrip({
    required this.selectedIndex,
    required this.onDateSelected,
    super.key,
  });

  final int selectedIndex;
  final ValueChanged<int> onDateSelected;

  static const _days = ['M', 'TU', 'W', 'TH', 'F', 'SA', 'SU'];
  static const _dates = ['21', '22', '23', '24', '25', '26', '27'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return SizedBox(
      height: 79,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _days.length,
        separatorBuilder: (context, index) => 17.83.widthBox,
        itemBuilder: (context, index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onDateSelected(index),
            child: Column(
              children: [
                Text(_days[index], style: theme.bold14.copyWith(fontSize: 12)),
                12.heightBox,
                Expanded(
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isSelected
                          ? AppColors.primaryGreen.withValues(alpha: 0.19)
                          : AppColors.primaryGrey,
                      border: isSelected
                          ? Border.all(
                              color: AppColors.primaryGreen,
                              width: 1.5,
                            )
                          : null,
                    ),
                    alignment: Alignment.center,
                    child: Text(_dates[index], style: theme.bold14),
                  ),
                ),
                8.heightBox,
                if (isSelected)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryGreen,
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
