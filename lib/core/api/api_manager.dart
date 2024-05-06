import 'package:dio/dio.dart';
import 'package:e_commerce_route/core/utils/constants.dart';

class ApiManager{
static late Dio dio ;

static init (){
  dio = Dio(
    BaseOptions(
      baseUrl: Constants.BaseURL,
    )
  );
}

Future<Response> getRequest({required String endPoint ,Map<String, dynamic>? queryParameters }) async {
  var request = await dio.get(endPoint,queryParameters: queryParameters);
  return request ;
}
Future<Response> postRequest({required String endPoint , Map<String, dynamic>? body}) async {
  var request = await dio.get(endPoint,data:body );
  return request ;
}
}