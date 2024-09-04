import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_list_omar_ahmed/core/helper/spacing.dart';
import 'package:play_list_omar_ahmed/core/theme/styles.dart';

class DoctorsListView extends StatelessWidget {
  const DoctorsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context , index){
          return Container(
            margin: EdgeInsets.only(
              bottom: 16.h
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset('assets/images/doctor_home.png',
                  width: 110.w,
                  height: 120.h,
                  fit: BoxFit.cover,
                  ),
                ),
                horizontalSpace(16.w), 
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dr. Randy Wigham',
                        style: TextStyles.font16DarkBlueBold, 
                        overflow: TextOverflow.ellipsis,
                      ),
                      verticalSpace(5.h),
                      Text(
                        'General | 01012467440',
                        style: TextStyles.font12GrayMedium, 
                      ),
                      verticalSpace(5.h),
                      Text(
                        'doctor@gmail.com',
                        style: TextStyles.font12GrayMedium, 
                      ),
                    ],
                  ),
                  ),
              ],
            ),
          );
        }
        ),
    );
  }
}