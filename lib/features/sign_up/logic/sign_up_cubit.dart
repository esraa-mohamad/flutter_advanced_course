import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_list_omar_ahmed/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:play_list_omar_ahmed/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:play_list_omar_ahmed/features/sign_up/logic/sign_up_state.dart';


class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo signUpRepo;
  SignUpCubit(this.signUpRepo) : super(const SignUpState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  void emitStateSignUp() async{
    emit(const SignUpState.signUpLoading());
    final response = await signUpRepo.signUp(
      SignUpRequestBody(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          gender: 0,
          password: passwordController.text,
          passwordConfirmation: passwordController.text,
      ),
    );

    response.when(
        success: (signUpResponse){
          emit(SignUpState.signUpSuccess(signUpResponse));
        },
        failure: (error){
          emit(SignUpState.signUpeError(error: error.apiErrorModel.message ?? ''));
        }
    );
  }
}
