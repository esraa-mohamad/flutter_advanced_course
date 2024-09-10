import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:play_list_omar_ahmed/features/home/data/model/specialization_response_model.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/styles.dart';

class SpecialityListViewItem extends StatelessWidget {
  const SpecialityListViewItem({
    super.key,
    required this.specializationDate,
    required this.itemIndex,
    required this.selectedIndex,
  });

  final SpecializationDate? specializationDate;

  final int itemIndex;

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(start: itemIndex == 0 ? 0 : 24.w),
      child: Column(
        children: [
          selectedIndex == itemIndex
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ColorsManager.darkBlue,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: ColorsManager.lightBlue,
                    child: SvgPicture.asset(
                      'assets/svg/heart.svg',
                      height: 42.h,
                      width: 42.h,
                    ),
                  ),
                )
              : CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset('assets/svg/heart.svg',
                      height: 40.h, width: 40.h),
                ),
          verticalSpace(8.h),
          Text(
            specializationDate?.name ?? 'Specialization',
            style:
                selectedIndex == itemIndex ?
              TextStyles.font14DarkBlueBold
            : TextStyles.font12DarkBlueRegular,
          ),
        ],
      ),
    );
  }
}
