import 'package:flutter/material.dart';
import 'package:play_list_omar_ahmed/core/helper/extensions.dart';
import 'package:play_list_omar_ahmed/core/theme/colors.dart';
import 'package:play_list_omar_ahmed/core/theme/styles.dart';

import '../../../core/routing/routes.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(ColorsManager.mainBlue),
          // delete space above button( control by myself )
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: WidgetStateProperty.all(
            const Size(double.infinity, 52),
          ),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ))),
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
