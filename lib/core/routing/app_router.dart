import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:play_list_omar_ahmed/core/routing/routes.dart';
import 'package:play_list_omar_ahmed/features/home/ui/home_screen.dart';
import 'package:play_list_omar_ahmed/features/login/logic/login_cubit.dart';
import 'package:play_list_omar_ahmed/features/login/ui/login_screen.dart';
import 'package:play_list_omar_ahmed/features/onboarding/onboarding_screen.dart';
import 'package:play_list_omar_ahmed/features/sign_up/logic/sign_up_cubit.dart';
import 'package:play_list_omar_ahmed/features/sign_up/ui/sign_up_screen.dart';

import '../di/dependency_injection.dart';

class AppRouter {


  Route generateRoute(RouteSettings setting) {
    // this arguments to be passed in any screen like this (arguments as ClassName)
    final arguments = setting.arguments;

    switch (setting.name) {
      case Routes.onBoardingScreen :
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<LoginCubit>(),
                child: const LoginScreen(),
              ),
        );
      case Routes.homeScreen :
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.signUpScreen :
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider(
                create: (context) => getIt<SignUpCubit>(),
                child: const SignUpScreen(),
              ),
        );
      default :
        return MaterialPageRoute(
          builder: (_) =>
              Scaffold(
                body: Center(
                  child: Text('No route defined for ${setting.name}'),
                ),
              ),
        );
    }
  }
}