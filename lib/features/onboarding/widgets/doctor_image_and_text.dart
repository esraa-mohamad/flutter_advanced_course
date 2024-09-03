import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_list_omar_ahmed/core/theme/styles.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svg/doc_logo_low_opacity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white ,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter ,
              end: Alignment.topCenter,
              // number of arguments as number of colors
              stops: const [0.14 , 0.4]
            )
          ),
          child: Image.asset('assets/images/onboarding_doctor.png'),
        ),
        Positioned(
          bottom: 30,
            left: 0,
            right: 0,
            child: Text(
              'Best Doctor Appointment App' ,
              textAlign: TextAlign.center,
              style: TextStyles.font32BlueBold.copyWith(
                height: 1.4
              ),
            ),
        ),
      ],
    );
  }
}
