import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_evencir/core/constants/app_assets.dart';
import 'package:test_task_evencir/core/theme/app_text_styles.dart';
import 'package:test_task_evencir/core/theme/colors.dart';
import 'package:test_task_evencir/core/utils/extensions.dart';
import 'package:test_task_evencir/features/nutrition/presentation/widgets/info_card.dart';

import 'gradient_progress_bar.dart';

class InsightsSection extends StatelessWidget {
  const InsightsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('My Insights', style: theme.semiBold24),
        24.heightBox,
        Row(
          children: [
            Expanded(
              child: InfoCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: theme.semiBold24.copyWith(fontSize: 40),
                        children: [
                          TextSpan(text: '550 '),
                          TextSpan(
                            text: 'Calories',
                            style: theme.bold16.copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                    6.heightBox,
                    Text(
                      '1950 Remaining',
                      style: theme.medium24.copyWith(
                        fontSize: 14,
                        color: AppColors.primaryTextGreyLight,
                      ),
                    ),
                    39.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BarText(ratio: '0'),
                        BarText(ratio: '2500'),
                      ],
                    ),
                    8.heightBox,
                    GradientProgressBar(value: 550 / 2500),
                  ],
                ),
              ),
            ),
            12.widthBox,
            Expanded(
              child: InfoCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: theme.bold14.copyWith(fontSize: 40),
                        children: [
                          TextSpan(text: '75 '),
                          TextSpan(
                            text: 'kg',
                            style: theme.medium24.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    6.heightBox,
                    Row(
                      children: [
                        SvgPicture.asset(AppAssets.arrowTopRight),
                        4.widthBox,
                        Text(
                          '+1.6kg',
                          style: theme.medium24.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    38.heightBox,
                    Text('Weight', style: theme.bold16.copyWith(fontSize: 18)),
                  ],
                ),
              ),
            ),
          ],
        ),
        12.heightBox,
        const _HydrationCard(),
      ],
    );
  }
}

class BarText extends StatelessWidget {
  const BarText({super.key, required this.ratio});

  final String ratio;

  @override
  Widget build(BuildContext context) {
    return Text(
      ratio,
      style: Theme.of(context).textTheme.semiBold24.copyWith(fontSize: 14),
    );
  }
}

class _HydrationCard extends StatelessWidget {
  const _HydrationCard();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '0%',
                      style: theme.semiBold24.copyWith(
                        fontSize: 40,
                        color: AppColors.primaryBlue,
                      ),
                    ),
                    43.heightBox,
                    Text(
                      'Hydration',
                      style: theme.bold16.copyWith(fontSize: 18),
                    ),
                    4.heightBox,
                    Text('Log Now', style: theme.regular12),
                  ],
                ),
              ),
              const _HydrationLevels(),
            ],
          ),
          13.78.heightBox,
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: AppColors.primaryAquaBlueDark,
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text('500 ml added to water log', style: theme.regular12),
          ),
        ],
      ),
    );
  }
}

class _HydrationLevels extends StatelessWidget {
  const _HydrationLevels();

  static const _levelData = ['2 L', null, null, null, '0 L'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SizedBox(
      width: 72,
      height: 120,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 14,
            top: 6,
            bottom: 6,
            child: Container(width: 1, color: AppColors.primaryCharcoal),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _levelData.map((level) => Levels(data: level)).toList(),
          ),
          Positioned(
            right: -7,
            bottom: 0,
            child: Text(
              '0ml',
              style: theme.semiBold24.copyWith(
                fontSize: 10,
                color: AppColors.primaryBlue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Levels extends StatelessWidget {
  const Levels({super.key, this.data});

  final String? data;

  static const _filledTickWidth = 14.0;
  static const _emptyTickWidth = 10.0;
  static const _tickHeight = 3.0;
  static const _inactiveAlpha = 0.2;

  bool get _hasData => data != null && data!.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final tickColor = AppColors.primaryBlue.withValues(
      alpha: _hasData ? 1 : _inactiveAlpha,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: _hasData ? _filledTickWidth : _emptyTickWidth,
          height: _tickHeight,
          decoration: BoxDecoration(
            color: tickColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        if (_hasData) ...[
          7.widthBox,
          Text(data!, style: theme.semiBold24.copyWith(fontSize: 10)),
        ],
      ],
    );
  }
}
