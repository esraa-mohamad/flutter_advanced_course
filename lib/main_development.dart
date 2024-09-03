import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_list_omar_ahmed/core/di/dependency_injection.dart';
import 'package:play_list_omar_ahmed/core/routing/app_router.dart';
import 'package:play_list_omar_ahmed/doc_app.dart';

void main() async{
  setUpGetIt();
  // To fix texts being hidden bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  runApp( DocApp(appRouter: AppRouter(),));
}



