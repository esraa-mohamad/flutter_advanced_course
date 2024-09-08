import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:play_list_omar_ahmed/core/helper/spacing.dart';
import 'package:play_list_omar_ahmed/core/theme/colors.dart';
import 'package:play_list_omar_ahmed/core/theme/styles.dart';
import 'package:play_list_omar_ahmed/features/home/data/model/specialization_response_model.dart';
import 'package:play_list_omar_ahmed/features/home/ui/widgets/doctor_speciality_item.dart';

// ignore: must_be_immutable
class DoctorSpecialityListView extends StatelessWidget {

  const DoctorSpecialityListView({super.key, required this.specializationDataList});

  final List<SpecializationDate?> specializationDataList ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specializationDataList.length,
        itemBuilder: (context , index){
          return DoctorSpecialityItem(
              specializationDate:specializationDataList[index],
              itemIndex: index
          );
        }
        ),
    );
  }
}