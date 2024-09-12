import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_list_omar_ahmed/core/helper/extensions.dart';
import 'package:play_list_omar_ahmed/core/networking/api_error_handler.dart';
import 'package:play_list_omar_ahmed/features/home/data/model/specialization_response_model.dart';
import 'package:play_list_omar_ahmed/features/home/data/repo/home_repo.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeState.initial());
  final HomeRepo _homeRepo;

  List<SpecializationDate?>? specializationDataList = [];

  void getSpecialization() async {
    emit(HomeState.specializationLoading());
    final result = await _homeRepo.getSpecialization();
    result.when(success: (specializationResponseModel) {
      specializationDataList =
          specializationResponseModel.specializationData ?? [];
      getDoctorList(specializationId: specializationDataList?.first?.id);
      emit(HomeState.specializationSuccess(specializationDataList));
    }, failure: (error) {
      emit(HomeState.specializationError(error));
    });
  }

  void getDoctorList({required int? specializationId}) {
    List<Doctors?>? doctorsList =
    getDoctorsListBySpecializationId(specializationId);
    if (!doctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorsSuccess(doctorsList));
    }else{
      emit(HomeState.doctorsError(ApiErrorHandler.handle('No Doctors Found')));
    }
  }

  /// return doctors list based on specialization id
  getDoctorsListBySpecializationId(int? specializationId) {
    return specializationDataList
        ?.firstWhere((specialization) => specialization?.id == specializationId)
        ?.doctorsList;
  }
}
