import 'package:dio/dio.dart';
import 'package:e_commerce_route/core/utils/constants.dart';
import 'package:injectable/injectable.dart';
@singleton
class ApiManager{
static late Dio dio ;

static init (){
  dio = Dio(
    BaseOptions(
      baseUrl: Constants.BaseURL,
        validateStatus: (status){
          if(status!<500){
            return true;
          }
          return false;
        }
    )
  );
}

Future<Response> getRequest({required String endPoint ,Map<String, dynamic>? queryParameters }) async {
  var response = await dio.get(endPoint,queryParameters: queryParameters);
  return response ;
}
Future<Response> postRequest({required String endPoint , Map<String, dynamic>? body}) async {
  var response = await dio.get(endPoint,data:body );
  return response ;
}
}