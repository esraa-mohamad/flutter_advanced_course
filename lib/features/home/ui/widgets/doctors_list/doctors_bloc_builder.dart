import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_list_omar_ahmed/features/home/logic/home_cubit.dart';
import 'package:play_list_omar_ahmed/features/home/logic/home_state.dart';
import 'package:play_list_omar_ahmed/features/home/ui/widgets/doctors_list/doctors_list_view.dart';

class DoctorsBlocBuilder extends StatelessWidget {
  const DoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is DoctorsSuccess || current is DoctorsError,
        builder: (context, state) {
          return state.maybeWhen(doctorsSuccess: (doctorsList) {
            return setUpSuccess(doctorsList);
          }, doctorsError: (error) {
            return setUpError();
          }, orElse: () {
            return const SizedBox.shrink();
          });
        });
  }

  Widget setUpSuccess(doctorsList) {
    return DoctorsListView(doctorsList: doctorsList);
  }

  Widget setUpError() {
    return const SizedBox.shrink();
  }
}
