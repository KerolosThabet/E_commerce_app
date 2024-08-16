import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/core/api/EndPoints.dart';
import 'package:e_commerce_route/core/api/api_manager.dart';
import 'package:e_commerce_route/data/dataSource_contract/Auth_dataSource.dart';
import 'package:e_commerce_route/data/model/auth_response/Auth_Response.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthDatasource)
class AuthDataSourceImpl extends AuthDatasource{
  ApiManager apiManager ;
  @factoryMethod
  AuthDataSourceImpl(this.apiManager);
  @override
  Future<Either<AuthResponse, String>> SignIn({required String email, required String password}) {
    // TODO: implement SignIn
    throw UnimplementedError();
  }

  @override
  Future<Either<AuthResponse, String>> SignUp(
      {required String email, required String password, required String name, required String mobile}
      ) async {
   try{
     var response = await apiManager.postRequest(endpoint: EndPoint.SignUpEndPoint ,
         body: {
           "name": name,
           "email":email,
           "password":password,
           "rePassword":password,
           "phone":mobile
         } );
     AuthResponse Response = AuthResponse.fromJson(response.data);
     if(Response.message!=null){
       return right(Response.message??'');
     }else{
       return left(Response);
     }

   }catch(Error){
     return right(Error.toString());
   }
   }

}
