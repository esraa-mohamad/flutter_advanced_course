import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_list_omar_ahmed/core/theme/colors.dart';
import 'package:play_list_omar_ahmed/core/theme/styles.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.contentPadding,
      this.focusedBorder,
      this.enabledBorder,
      this.style,
      required this.hintText,
      this.hintStyle,
      this.suffixIcon,
      this.obscureText,
      this.backgroundColor,
      this.controller,
      required this.validator});

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;

  final InputBorder? enabledBorder;
  final TextStyle? style;

  final String? hintText;
  final TextStyle? hintStyle;
  final bool? obscureText;

  final Widget? suffixIcon;
  final Color? backgroundColor;

  final TextEditingController? controller;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(
                horizontal: 20.w,
                vertical: 18.h,
              ),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: ColorsManager.mainBlue, width: 1.3),
                  borderRadius: BorderRadius.circular(16),
              ),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                    color: ColorsManager.lighterGray, width: 1.3),
              ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                color: Colors.red, width: 1.3),
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
                color: Colors.red, width: 1.3),
          ),
          hintText: hintText,
          hintStyle: hintStyle ?? TextStyles.font14LightGrayRegular,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: backgroundColor ?? ColorsManager.moreLightGray),
      obscureText: obscureText ?? false,
      style: TextStyles.font14DarkBlueMedium,
      validator: (value){
        return validator(value);
      },
    );
  }
}
