import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:play_list_omar_ahmed/core/networking/api_error_model.dart';
import 'package:play_list_omar_ahmed/features/home/data/model/specialization_response_model.dart';

part 'home_state.freezed.dart';
@freezed
class HomeState with _$HomeState{
  factory HomeState.initial()= _Initial;

  // Specialization state
  factory HomeState.specializationLoading()= SpecializationLoading;
  factory HomeState.specializationSuccess(List<SpecializationDate?> ? specializationData)= SpecializationSuccess;
  factory HomeState.specializationError(ApiErrorModel apiErrorModel)= SpecializationError;

  // Doctors stet
  factory HomeState.doctorsSuccess(List<Doctors?>? doctorsList) = DoctorsSuccess ;
  factory HomeState.doctorsError(ApiErrorModel apiErrorModel) = DoctorsError;
}


