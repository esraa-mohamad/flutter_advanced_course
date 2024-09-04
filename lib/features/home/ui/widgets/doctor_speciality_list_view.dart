import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_list_omar_ahmed/core/helper/spacing.dart';
import 'package:play_list_omar_ahmed/core/theme/colors.dart';
import 'package:play_list_omar_ahmed/core/theme/styles.dart';

// ignore: must_be_immutable
class DoctorSpecialityListView extends StatelessWidget {
   DoctorSpecialityListView({super.key});
  List doctorSpeciality = [
  {
    "image" : 'assets/svg/general.svg' , 
    "speciality" : 'General'
  },
  {
    "image" : 'assets/svg/brain.svg' , 
    "speciality" : 'Neurologic'
  },
  {
    "image" : 'assets/svg/lamge.svg' , 
    "speciality" : 'Pediatric'
  },
  {
    "image" : 'assets/svg/kidney.svg' , 
    "speciality" : 'Radiology'
  },
  {
    "image" : 'assets/svg/teath.svg' , 
    "speciality" : 'Dentistry'
  },
  {
    "image" : 'assets/svg/heart.svg' , 
    "speciality" : 'cardiologist'
  },
  {
    "image" : 'assets/svg/liver.svg' , 
    "speciality" : 'Hepatology'
  },
  {
    "image" : 'assets/svg/stomch.svg' , 
    "speciality" : 'Histologist'
  },

  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: doctorSpeciality.length,
        itemBuilder: (context , index){
          return Padding(
            padding: EdgeInsetsDirectional.only(
              start: index==0 ? 0 : 24.w
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28 , 
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset(
                    doctorSpeciality[index]['image'],
                    height: 40.h,
                    width: 40.h
                    ),
                ),
                verticalSpace(8.h),
                Text(
                  doctorSpeciality[index]['speciality'],
                  style: TextStyles.font12DarkBlueRegular,
                  ),
              ],
              
            ),
          );
        }
        ),
    );
  }
}