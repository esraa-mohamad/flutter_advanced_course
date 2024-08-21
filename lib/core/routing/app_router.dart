import 'package:flutter/material.dart';
import 'package:play_list_omar_ahmed/core/routing/routes.dart';
import 'package:play_list_omar_ahmed/features/login/ui/login_screen.dart';
import 'package:play_list_omar_ahmed/features/onboarding/onboarding_screen.dart';

class AppRouter{


  Route generateRoute(RouteSettings setting){
    // this arguments to be passed in any screen like this (arguments as ClassName)
    final arguments = setting.arguments;

    switch(setting.name){
      case Routes.onBoardingScreen :
        return MaterialPageRoute(
            builder: (_) => const OnBoardingScreen(),
        );
      case Routes.loginScreen :
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      default :
        return MaterialPageRoute(
          builder: (_) =>  Scaffold(
            body: Center(
              child: Text('No route defined for ${setting.name}'),
            ),
          ),
        );
    }
  }
}