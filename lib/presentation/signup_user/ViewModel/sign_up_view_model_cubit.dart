import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_route/domain/usecases/SignuUp_Usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';


part 'sign_up_view_model_state.dart';
@injectable
class SignUpViewModel extends Cubit<SignUpViewModelState> {
  @factoryMethod
  SignUpViewModel(this.signUpUseCase) : super(SignUpViewModelInitial());
 static SignUpViewModel get(BuildContext context )=>BlocProvider.of(context);
 SignUpUseCase signUpUseCase ;

  SignUp({required String email, required String mobile, required String name, required String password}) async {
  emit(SignUpLoadingState());
    var response= await signUpUseCase.call(email: email, password: password, name: name, mobile: mobile);
   response.fold(
           (response){
             emit(SignUpSuccessState(response.token??''));
           }, (error){
          emit(SignUpErrorState(error));
   });
 }
}
