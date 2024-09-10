import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_list_omar_ahmed/core/helper/spacing.dart';
import 'package:play_list_omar_ahmed/features/home/ui/widgets/speciality_list/speciality_shimmer_loading.dart';

import '../../../logic/home_cubit.dart';
import '../../../logic/home_state.dart';
import '../doctors_list/doctors_shimmer_loading.dart';
import 'speciality_list_view.dart';
import 'package:play_list_omar_ahmed/features/home/data/model/specialization_response_model.dart';

class SpecializationBlocBuilder extends StatelessWidget {
  const SpecializationBlocBuilder({super.key});

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
                var specializationList = specializationResponseModel;
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

  Widget setUpSuccess(List<SpecializationDate?>? specializationList) {
    return SpecialityListView(
      specializationDataList: specializationList ??[],
    );
  }

  Widget setUpLoading(){
    return Expanded(child: Column(
      children: [
        const SpecialityShimmerLoading(),
        verticalSpace(8),
        const DoctorsShimmerLoading(),
      ],
    ),);
  }

}
