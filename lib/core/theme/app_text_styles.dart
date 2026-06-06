import 'package:flutter/material.dart';

import 'colors.dart';

extension CustomTextStyles on TextTheme {
  TextStyle get regular14 => TextStyle(
    color: AppColors.primaryGrey,
    fontSize: 14,
    fontFamily: 'Mulish',
    fontWeight: FontWeight.w400,
  );

  TextStyle get bold14 => TextStyle(
    color: AppColors.primaryWhite,
    fontSize: 14,
    fontFamily: 'Mulish',
    fontWeight: FontWeight.w700,
  );

  TextStyle get bold16 => TextStyle(
    color: AppColors.primaryWhite,
    fontSize: 16,
    fontFamily: 'Mulish',
    fontWeight: FontWeight.w700,
  );

  TextStyle get semiBold24 => TextStyle(
    color: AppColors.primaryWhite,
    fontSize: 24,
    fontFamily: 'Mulish',
    fontWeight: FontWeight.w600,
  );

  TextStyle get medium24 => TextStyle(
    color: AppColors.primaryWhite,
    fontSize: 24,
    fontFamily: 'Mulish',
    fontWeight: FontWeight.w500,
  );

  TextStyle get regular12 => TextStyle(
    color: AppColors.primaryWhite,
    fontSize: 12,
    fontFamily: 'Mulish',
    fontWeight: FontWeight.w400,
  );
}
