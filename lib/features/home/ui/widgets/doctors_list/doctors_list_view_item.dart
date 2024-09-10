import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/helper/spacing.dart';
import '../../../../../core/theme/styles.dart';
import '../../../data/model/specialization_response_model.dart';

class DoctorsListViewItem extends StatelessWidget {
  const DoctorsListViewItem({super.key, required this.doctors});

  final Doctors? doctors;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          CachedNetworkImage(
            width: 110.w,
            height: 110.h,
            imageUrl: 'https://www.shutterstock.com/image-photo/profile-photo-attractive-family-doc-600nw-1724693776.jpg',
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(
              value: downloadProgress.progress,
            ),
            errorWidget: (context , url , error)=>
                Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.red ,
                      width: 2 ,
                    )
                  ),
                  child: const Icon(
                    Icons.error ,
                    size: 30,
                    color: Colors.redAccent,
                  ),
                ),
          ),
          horizontalSpace(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  doctors?.name ?? 'No name',
                  style: TextStyles.font16DarkBlueBold,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpace(5.h),
                Text(
                  '${doctors?.degree ?? 'No Specialization'} | ${doctors?.phone ?? 'No number'}',
                  style: TextStyles.font12GrayMedium,
                ),
                verticalSpace(5.h),
                Text(
                  doctors?.email ?? 'No email',
                  style: TextStyles.font12GrayMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
