import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:play_list_omar_ahmed/core/helper/extensions.dart';
import 'package:play_list_omar_ahmed/core/routing/routes.dart';

import '../../../../core/theme/styles.dart';


class DonotHaveAccount extends StatelessWidget {
  const DonotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Do\'nt have an account?',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' Sign Up',
            style: TextStyles.font13BlueSemiBold,
            recognizer: TapGestureRecognizer()..onTap = () {
              context.pushNamed(Routes.signUpScreen);
              },
          ),
        ],
      ),
    );
  }
}