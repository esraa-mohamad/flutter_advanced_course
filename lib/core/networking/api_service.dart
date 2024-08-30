
import 'package:dio/dio.dart';
import 'package:play_list_omar_ahmed/core/networking/api_constants.dart';
import 'package:play_list_omar_ahmed/features/login/data/models/login_request_body.dart';
import 'package:play_list_omar_ahmed/features/login/data/models/login_response.dart';
import 'package:play_list_omar_ahmed/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:play_list_omar_ahmed/features/sign_up/data/models/sign_up_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl : ApiConstants.apiBaseUrl)
abstract class ApiService{

  factory ApiService(Dio dio , {String? baseUrl}) = _ApiService;
  
  @POST(ApiConstants.login)
  Future<LoginResponse> login(
      @Body() LoginRequestBody loginRequestBody ,
      );

  @POST(ApiConstants.signUp)
  Future<SignUpResponse> signUp(
      @Body() SignUpRequestBody signUpRequestBody ,
      );
}