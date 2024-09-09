import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:play_list_omar_ahmed/core/routing/app_router.dart';
import 'package:play_list_omar_ahmed/core/theme/colors.dart';
import 'core/helper/constants.dart';
import 'core/routing/routes.dart';

class DocApp extends StatelessWidget {
  const DocApp({super.key, required this.appRouter});

  final AppRouter appRouter ; 
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Doc Doc',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: ColorsManager.mainBlue
          ),
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white ,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: isLoggedInUser ? Routes.homeScreen : Routes.loginScreen,
        onGenerateRoute: appRouter.generateRoute,
      )
    );
  }
}
