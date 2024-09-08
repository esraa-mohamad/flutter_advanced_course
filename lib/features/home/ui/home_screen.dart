import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_list_omar_ahmed/core/helper/spacing.dart';
import 'package:play_list_omar_ahmed/features/home/ui/widgets/doctor_speciality_see_all.dart';
import 'package:play_list_omar_ahmed/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:play_list_omar_ahmed/features/home/ui/widgets/home_top_bar.dart';
import 'package:play_list_omar_ahmed/features/home/ui/widgets/specialization_and_doctors_bloc_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(
            20,
            16,
            20,
            28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTopBar(),
              const DoctorsBlueContainer(),
              verticalSpace(16.h),
              const DoctorSpecialitySeeAll(),
              verticalSpace(18.h),
              const SpecializationAndDoctorsBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }


}
