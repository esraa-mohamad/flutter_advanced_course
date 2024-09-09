import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_list_omar_ahmed/core/di/dependency_injection.dart';
import 'package:play_list_omar_ahmed/core/helper/constants.dart';
import 'package:play_list_omar_ahmed/core/helper/extensions.dart';
import 'package:play_list_omar_ahmed/core/helper/shared_preferences_helper.dart';
import 'package:play_list_omar_ahmed/core/routing/app_router.dart';
import 'package:play_list_omar_ahmed/doc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  await checkIfLoggedInUser();
  runApp(
    DocApp(
      appRouter: AppRouter(),
    ),
  );
}

checkIfLoggedInUser()async{
  String? userToken  =  await SharedPreferencesHelper.getSecuredString(SharedPrefKey.userToke);
  if(!userToken.isNullOrEmpty()){
    isLoggedInUser = true;
  }
  isLoggedInUser=false;
}