import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domain/repository_contracts/Auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../entites/Auth_Entity/AuthEntity.dart';

@injectable
class SignUpUseCase{
  AuthRepo authRepo ;
  @factoryMethod
  SignUpUseCase(this.authRepo);
  Future<Either<AuthEntity, String>> call({
    required String email,
    required String password,
    required String name,
    required String mobile })=> authRepo.SignUp(email: email, password: password, name: name, mobile: mobile);
}