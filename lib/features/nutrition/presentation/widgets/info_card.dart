import 'package:flutter/material.dart';
import 'package:test_task_evencir/core/theme/colors.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13.78),
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 18, blurStyle: BlurStyle.outer)],
        color: AppColors.primaryGrey,
        borderRadius: BorderRadius.circular(6.89),
      ),
      child: child,
    );
  }
}
