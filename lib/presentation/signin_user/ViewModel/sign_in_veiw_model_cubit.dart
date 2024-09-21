import 'package:bloc/bloc.dart';
import 'package:e_commerce_route/domain/entites/Auth_Entity/AuthEntity.dart';
import 'package:e_commerce_route/domain/usecases/SignIn_Usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'sign_in_veiw_model_state.dart';
@injectable
class SignInViewModel extends Cubit<SignInViewModelState> {
  @factoryMethod
  SignInViewModel(this.signInUseCase) : super(SignInViewModelInitial());
  SignInUseCase signInUseCase;

  static SignInViewModel get(context)=>BlocProvider.of(context);

  SingIn({required String email , required String password})async{
    emit(SignInViewModelLoading());
    var result = await signInUseCase.call(email: email, password: password);
    result.fold(
            (authEntity){
              emit(SignInViewModelSuccess(authEntity));
            }, (error){
              emit(SignInViewModelError(error));
    });

  }

}
