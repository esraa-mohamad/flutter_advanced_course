import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:play_list_omar_ahmed/core/networking/api_service.dart';
import 'package:play_list_omar_ahmed/core/networking/dio_factory.dart';
import 'package:play_list_omar_ahmed/features/home/data/apis/home_api_service.dart';
import 'package:play_list_omar_ahmed/features/home/data/repo/home_repo.dart';
import 'package:play_list_omar_ahmed/features/home/logic/home_cubit.dart';
import 'package:play_list_omar_ahmed/features/login/data/repos/login_repo.dart';
import 'package:play_list_omar_ahmed/features/login/logic/login_cubit.dart';
import 'package:play_list_omar_ahmed/features/sign_up/data/repos/sign_up_repo.dart';
import 'package:play_list_omar_ahmed/features/sign_up/logic/sign_up_cubit.dart';

final getIt = GetIt.instance ;

Future<void> setUpGetIt () async{
  // Dio and ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login
  getIt.registerLazySingleton<LoginRepo>(()=> LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(()=> LoginCubit(getIt()));

  // signUp
  getIt.registerLazySingleton<SignUpRepo>(()=> SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(()=> SignUpCubit(getIt()));

  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(()=> HomeRepo(getIt()));
  //getIt.registerFactory<HomeCubit>(()=> HomeCubit(getIt()));
}