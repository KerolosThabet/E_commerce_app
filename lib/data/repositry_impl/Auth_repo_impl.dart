import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/dataSource_contract/Auth_dataSource.dart';
import 'package:e_commerce_route/domain/entites/Auth_Entity/AuthEntity.dart';
import 'package:e_commerce_route/domain/repository_contracts/Auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo{
  AuthDatasource apiDatasource;
  @factoryMethod
  AuthRepoImpl(this.apiDatasource);


  @override
  Future<Either<AuthEntity, String>> SignUp(
      {required String email,
        required String password,
        required String name,
        required String mobile}) async {
   var response = await apiDatasource.SignUp(email: email, password: password, name: name, mobile: mobile);
  return response.fold(
           (response){
             AuthEntity authEntity = response.toAuthEntity();
             return left(authEntity);
           },
           (Error){
             return right(Error.toString());
           });
  }

  @override
  Future<Either<AuthEntity, String>> SignIN({required String email, required String password}) async{
    var response = await apiDatasource.SignIn(email: email, password: password);
    return response.fold(
            (response){
              AuthEntity authEntity = response.toAuthEntity();
              return left(authEntity);
            }, (error){
              return right(error.toString());
    });

  }


}