import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_list_omar_ahmed/core/helper/constants.dart';
import 'package:play_list_omar_ahmed/core/helper/shared_preferences_helper.dart';
import 'package:play_list_omar_ahmed/core/networking/dio_factory.dart';
import 'package:play_list_omar_ahmed/features/login/data/models/login_request_body.dart';

import '../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super(const LoginState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitStateLogin() async{
    emit(const LoginState.loginLoading());
    final response = await loginRepo.login(
      LoginRequestBody(
          email: emailController.text,
          password: passwordController.text ,
      ),
    );
    
    response.when(
        success: (loginResponse) async{
          await saveUserToken(loginResponse.userData?.token  ?? '');
          emit(LoginState.loginSuccess(loginResponse));
        },
        failure: (apiErrorModel){
          emit(LoginState.loginError(apiErrorModel));
        }
    );
  }

  Future<void> saveUserToken(String token) async {
    await  SharedPreferencesHelper.setSecuredString(SharedPrefKey.userToke, token);
    DioFactory.setTokenIntoHeaderAfterLogin(token);
  }
}
