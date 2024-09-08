import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/spacing.dart';
import '../../logic/home_cubit.dart';
import '../../logic/home_state.dart';
import 'doctor_speciality_list_view.dart';
import 'doctors_list_view.dart';
import 'package:play_list_omar_ahmed/features/home/data/model/specialization_response_model.dart';

class SpecializationAndDoctorsBlocBuilder extends StatelessWidget {
  const SpecializationAndDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
        current is SpecializationLoading ||
            current is SpecializationSuccess ||
            current is SpecializationError,
        builder: (context ,state){
          return state.maybeWhen(
              specializationLoading: (){
                return setUpLoading();
              } ,
              specializationSuccess: (specializationResponseModel){
                var specializationList = specializationResponseModel.specializationData;
                return setUpSuccess(specializationList);
              },
              specializationError: (error){
                return const SizedBox.shrink();
              },
              orElse: () {
                return const SizedBox.shrink();
              }
          );
        }
    );
  }

  Expanded setUpSuccess(List<SpecializationDate?>? specializationList) {
    return Expanded(
                child: Column(
                  children: [
                    DoctorSpecialityListView(
                      specializationDataList: specializationList ??[],
                    ),
                    verticalSpace(8.h),
                    DoctorsListView(
                      doctorsList: specializationList![0]!.doctorsList,
                    ),
                  ],
                ),
              );
  }

  Widget setUpLoading(){
    return const SizedBox(
      height: 100,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

}
