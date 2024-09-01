import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_list_omar_ahmed/core/theme/styles.dart';
import 'package:play_list_omar_ahmed/core/widgets/app_text_button.dart';
import 'package:play_list_omar_ahmed/features/login/ui/widgets/email_and_password.dart';
import 'package:play_list_omar_ahmed/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:play_list_omar_ahmed/features/login/ui/widgets/do_not_have_account_text.dart';
import 'package:play_list_omar_ahmed/features/login/ui/widgets/terms_and_conditions.dart';

import '../../../core/helper/spacing.dart';
import '../logic/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 30.h,
              ),
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
              Column(
                children: [
                const EmailAndPassword(),
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
                    onPressed: () {
                      validateThenDoLogin(context);
                    },
                  ),
                  verticalSpace(16.h),
                  const TermsAndConditionsText(),
                  verticalSpace(60.h),
                  const DonotHaveAccount(),
                  const LoginBlocListener(),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if(context.read<LoginCubit>().formKey.currentState!.validate()){
      context.read<LoginCubit>().emitStateLogin();
    }
    // if(context.read<LoginCubit>().formKey.currentState!.validate()){
    //   context.read<LoginCubit>().emitStateLogin(
    //     LoginRequestBody(
    //         email: context.read<LoginCubit>().emailController.text,
    //         password: context.read<LoginCubit>().passwordController.text,
    //     ),
    //   );
    // }
  }
}
