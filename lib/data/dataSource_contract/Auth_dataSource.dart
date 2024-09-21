import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/data/model/auth_response/Auth_Response.dart';

abstract class AuthDatasource {
  Future<Either<AuthResponse, String>> SignUp(
      {required String email,
      required String password,
      required String name,
      required String mobile});

  Future<Either<AuthResponse, String>> SignIn(
      {required String email, required String password});
}
