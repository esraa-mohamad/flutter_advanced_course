import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_list_omar_ahmed/core/helper/extensions.dart';
import 'package:play_list_omar_ahmed/core/networking/api_error_model.dart';
import 'package:play_list_omar_ahmed/core/routing/routes.dart';
import 'package:play_list_omar_ahmed/core/theme/colors.dart';
import 'package:play_list_omar_ahmed/core/theme/styles.dart';
import 'package:play_list_omar_ahmed/features/login/logic/login_cubit.dart';
import 'package:play_list_omar_ahmed/features/login/logic/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginLoading || current is LoginSuccess || current is LoginError,
      listener: (context, state) {
        state.whenOrNull(
          loginLoading: (){
            showDialog(
                context: context,
                builder: (context)=> const CircularProgressIndicator(
                  color: ColorsManager.mainBlue,
                )
            );
          },
          loginSuccess: (loginResponse){
            context.pop();
            context.pushNamed(Routes.homeScreen,);
          },
          loginError: (apiErrorModel){
            context.pop();
            setUpErrorState(context, apiErrorModel);
          }
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setUpErrorState(BuildContext context, ApiErrorModel apiErrorModel) {
    showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          icon: const Icon(
            Icons.error,
            size: 32,
            color: Colors.red,
          ),
          content:Text(
            apiErrorModel.getAllStringMessages() ,
            style: TextStyles.font15DarkBlueMedium,
          ) ,
          actions: [
            TextButton(
                onPressed: (){
                  context.pop();
                },
                child: Text(
                  'Got It',
                  style: TextStyles.font14BlueSemiBold,
                ),
            ),
          ],
        ),
    );
  }
}
