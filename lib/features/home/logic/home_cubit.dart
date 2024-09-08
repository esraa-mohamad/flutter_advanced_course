
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_list_omar_ahmed/features/home/data/repo/home_repo.dart';

import 'home_state.dart';


class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeRepo) : super(HomeState.initial());
  final HomeRepo _homeRepo ;
  void getSpecialization() async{
    emit(HomeState.specializationLoading());
    final  result = await _homeRepo.getSpecialization();
    result.when(
        success: (specializationResponseModel){
          emit(HomeState.specializationSuccess(specializationResponseModel));
        },
        failure: (error){
          emit(HomeState.specializationError(error.apiErrorModel.message ??  ''));
        }
    );
  }
}
