import 'package:flutter/material.dart';
import 'package:test_task_evencir/core/theme/colors.dart';

class GradientProgressBar extends StatelessWidget {
  const GradientProgressBar({
    super.key,
    required this.value,
    this.height = 6,
    this.backgroundColor = AppColors.primaryIndicatorColor,
    this.gradientColors = const [
      Color(0xFF7BBDE2),
      Color(0xFF69C0B1),
      Color(0xFF60C198),
    ],
    this.borderRadius = 8,
  });

  final double value;
  final double height;
  final Color backgroundColor;
  final List<Color> gradientColors;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        height: height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(color: backgroundColor),
            FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: value.clamp(0.0, 1.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: gradientColors,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
