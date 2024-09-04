import 'package:flutter/material.dart';
import 'package:play_list_omar_ahmed/core/theme/styles.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  const DoctorSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          'Doctor Speciality',
          style: TextStyles.font18DarkBlueSemiBold
          ),
          const Spacer(),
          Text(
          'See All',
          style: TextStyles.font12BlueRegular
          ),
      ],
    );
  }
}