import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:play_list_omar_ahmed/core/networking/api_service.dart';
import 'package:play_list_omar_ahmed/core/networking/dio_factory.dart';
import 'package:play_list_omar_ahmed/features/login/data/repos/login_repo.dart';
import 'package:play_list_omar_ahmed/features/login/logic/login_cubit.dart';

final getIt = GetIt.instance ;

Future<void> setUpGetIt () async{
  // Dio and ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // login repo
  getIt.registerLazySingleton<LoginRepo>(()=> LoginRepo(getIt()));

  // login cubit
  getIt.registerLazySingleton<LoginCubit>(()=> LoginCubit(getIt()));
}