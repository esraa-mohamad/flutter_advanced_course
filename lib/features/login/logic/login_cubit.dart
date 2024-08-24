import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_list_omar_ahmed/features/login/data/models/login_request_body.dart';

import '../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());

  void emitStateLogin(LoginRequestBody  loginRequestBody) async{
    emit(const LoginState.loading());
    final response = await loginRepo.login(loginRequestBody);
    
    response.when(
        success: (loginResponse){
          emit(LoginState.success(loginResponse));
        },
        failure: (error){
          emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
        }
    );
  }
}
