import 'package:play_list_omar_ahmed/core/networking/api_error_handler.dart';
import 'package:play_list_omar_ahmed/core/networking/api_result.dart';
import 'package:play_list_omar_ahmed/features/home/data/apis/home_api_service.dart';
import 'package:play_list_omar_ahmed/features/home/data/model/specialization_response_model.dart';

class HomeRepo {

  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<SpecializationResponseModel>> getSpecialization() async{
    try {
      var response =await _homeApiService.getSpecialization();
      return ApiResult.success(response);

    }catch(error){
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }

  }


}