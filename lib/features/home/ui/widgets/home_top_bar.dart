import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_list_omar_ahmed/core/theme/colors.dart';
import 'package:play_list_omar_ahmed/core/theme/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi , Esraa!',
              style: TextStyles.font18DarkBlueBold,
              ),
              Text(
              'How Are you Today?',
              style: TextStyles.font12GrayRegular,
              ),
          ],
        ),
        const Spacer(),
        CircleAvatar(
          backgroundColor: ColorsManager.moreLighterGray,
          radius: 24,
          child: SvgPicture.asset('assets/svg/notifications.svg'),
        ),
      ],
    );
  }
}