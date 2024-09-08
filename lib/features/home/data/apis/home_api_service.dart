import 'package:dio/dio.dart';
import 'package:play_list_omar_ahmed/features/home/data/model/specialization_response_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/networking/api_constants.dart';
import 'home_api_constants.dart';
part 'home_api_service.g.dart';


@RestApi(baseUrl : ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio , {String ? baseUrl}) = _HomeApiService ;
  
  @GET(HomeApiConstants.specializationEP)
  Future<SpecializationResponseModel> getSpecialization();
  
}