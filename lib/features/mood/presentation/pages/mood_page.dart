import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_task_evencir/core/constants/app_assets.dart';
import 'package:test_task_evencir/core/theme/app_text_styles.dart';
import 'package:test_task_evencir/core/theme/colors.dart';
import 'package:test_task_evencir/core/utils/extensions.dart';

class MoodPage extends StatelessWidget {
  const MoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: AppColors.primaryBlack.withValues(alpha: 0.1),
              child: SvgPicture.asset(AppAssets.gradient),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mood',
                    style: theme.regular14.copyWith(
                      fontSize: 32,
                      color: AppColors.primaryWhite,
                    ),
                  ),
                  32.heightBox,
                  Text(
                    'Start your day',
                    style: theme.regular12.copyWith(
                      color: AppColors.primaryTextGreyLight,
                      fontSize: 18,
                    ),
                  ),
                  12.heightBox,
                  Text(
                    'How are you feeling at the Moment?',
                    style: theme.semiBold24,
                  ),
                  Expanded(
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(AppAssets.happy),
                            24.heightBox,
                            Text('Calm', style: theme.semiBold24),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const _ContinueButton(),
                  24.heightBox,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContinueButton extends StatelessWidget {
  const _ContinueButton();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryWhite,
          foregroundColor: AppColors.primaryBlack,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: Text(
          'Continue',

          /// I know the text is manrope here
          style: theme.semiBold24.copyWith(
            color: AppColors.primaryBlack,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
