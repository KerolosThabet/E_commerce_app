import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domain/entites/Auth_Entity/AuthEntity.dart';

abstract class AuthRepo {
 Future<Either<AuthEntity,String>> SignUp(
     {required String email,
      required String password,
      required String name,
      required String mobile});
}