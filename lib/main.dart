import 'package:flutter/material.dart';
import 'package:play_list_omar_ahmed/core/di/dependency_injection.dart';
import 'package:play_list_omar_ahmed/core/routing/app_router.dart';
import 'package:play_list_omar_ahmed/doc_app.dart';

void main() {
  setUpGetIt();
  runApp( DocApp(appRouter: AppRouter(),));
}



