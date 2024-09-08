import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:play_list_omar_ahmed/features/home/data/model/specialization_response_model.dart';

part 'home_state.freezed.dart';
@freezed
class HomeState with _$HomeState{
  factory HomeState.initial()= _Initial;

  // specialization state
  factory HomeState.specializationLoading()= SpecializationLoading;
  factory HomeState.specializationSuccess(SpecializationResponseModel specializationResponseModel)= SpecializationSuccess;
  factory HomeState.specializationError(String error)= SpecializationError;
}


