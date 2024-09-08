import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_list_omar_ahmed/features/home/data/model/specialization_response_model.dart';

import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';

class DoctorSpecialityItem extends StatelessWidget {
  const DoctorSpecialityItem({super.key, required this.specializationDate, required this.itemIndex});


  final SpecializationDate? specializationDate ;
  final int itemIndex ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: itemIndex==0 ? 0 : 24.w
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28 ,
            backgroundColor: ColorsManager.lightBlue,
            child: SvgPicture.asset(
                'assets/svg/heart.svg',
                height: 40.h,
                width: 40.h
            ),
          ),
          verticalSpace(8.h),
          Text(
            specializationDate?.name ?? 'Specialization',
            style: TextStyles.font12DarkBlueRegular,
          ),
        ],

      ),
    );
  }
}
