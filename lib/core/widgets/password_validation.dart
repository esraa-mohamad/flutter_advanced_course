import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_list_omar_ahmed/core/helper/spacing.dart';
import 'package:play_list_omar_ahmed/core/theme/colors.dart';
import 'package:play_list_omar_ahmed/core/theme/styles.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({super.key, required this.hasLowerCase, required this.hasUpperCase, required this.hasSpecialCharacters, required this.hasNumbers, required this.hasMinimumLength});

  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumbers;
  final bool hasMinimumLength ;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2.h),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2.h),
        buildValidationRow('At least 1 special characters', hasSpecialCharacters),
        verticalSpace(2.h),
        buildValidationRow('At least 1 number', hasNumbers),
        verticalSpace(2.h),
        buildValidationRow('At least 8 characters long', hasMinimumLength),
      ],
    );
  }

  Widget buildValidationRow(String text , bool hasValidate){
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(8),
        Text(
          text , style: TextStyles.font13DarkBlueRegular.copyWith(
          decoration:  hasValidate ? TextDecoration.lineThrough : null ,
          decorationColor:  Colors.green ,
          decorationThickness:  2 ,
          color:  hasValidate ? ColorsManager.gray : ColorsManager.darkBlue
        ),
        ),
      ],
    );
  }
}
