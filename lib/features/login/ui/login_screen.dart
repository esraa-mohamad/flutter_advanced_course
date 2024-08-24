import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_list_omar_ahmed/core/theme/styles.dart';
import 'package:play_list_omar_ahmed/core/widgets/app_text_button.dart';
import 'package:play_list_omar_ahmed/core/widgets/app_text_form_field.dart';
import 'package:play_list_omar_ahmed/features/login/ui/widgets/already_have_account_text.dart';
import 'package:play_list_omar_ahmed/features/login/ui/widgets/terms_and_conditions.dart';

import '../../../core/helper/spacing.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8.h),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpace(36.h),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const AppTextFormField(
                      hintText: 'Email',
                    ),
                    verticalSpace(18.h),
                    AppTextFormField(
                      hintText: 'Password',
                      obscureText: isObscureText,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        child: Icon(isObscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    verticalSpace(24.h),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forget Password?',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpace(24.h),
                    AppTextButton(
                        buttonText: 'Login',
                        textStyle: TextStyles.font16WhiteSemiBold,
                        onPressed: () {},
                    ),
                    verticalSpace(16.h),
                    const TermsAndConditionsText(),
                    verticalSpace(60.h),
                    const AlreadyHaveAccountText(),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
