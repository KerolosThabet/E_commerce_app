import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entites/Auth_Entity/AuthEntity.dart';
import '../repository_contracts/Auth_repo.dart';
@injectable
class SignInUseCase{
  AuthRepo authRepo;
  @factoryMethod
  SignInUseCase(this.authRepo);

  Future<Either<AuthEntity, String>> call({required String email , required String password})=>authRepo.SignIN(email: email, password: password);
}