import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_list_omar_ahmed/core/theme/styles.dart';
import 'package:play_list_omar_ahmed/core/widgets/app_text_button.dart';
import 'package:play_list_omar_ahmed/features/login/ui/widgets/email_and_password.dart';
import 'package:play_list_omar_ahmed/features/sign_up/logic/sign_up_cubit.dart';
import 'package:play_list_omar_ahmed/features/sign_up/ui/widgets/already_have_account_text.dart';
import 'package:play_list_omar_ahmed/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:play_list_omar_ahmed/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:play_list_omar_ahmed/features/sign_up/ui/widgets/terms_and_conditions.dart';

import '../../../core/helper/spacing.dart';
import '../data/models/sign_up_request_body.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});


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
                'Create Account',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8.h),
              Text(
                'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpace(36.h),
              Column(
                children: [
                const SignupForm(),
                  verticalSpace(24.h),
                  AppTextButton(
                    buttonText: 'Create Account',
                    textStyle: TextStyles.font16WhiteSemiBold,
                    onPressed: () {
                      validateThenDoLogin(context);
                    },
                  ),
                  verticalSpace(16.h),
                  const TermsAndConditionsText(),
                  verticalSpace(60.h),
                  const AlreadyHaveAccountText(),
                  const SignupBlocListener(),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if(context.read<SignUpCubit>().formKey.currentState!.validate()){
      context.read<SignUpCubit>().emitStateSignUp();
    }
  }
}
