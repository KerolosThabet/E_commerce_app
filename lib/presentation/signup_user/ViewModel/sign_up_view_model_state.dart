part of 'sign_up_view_model_cubit.dart';

@immutable
sealed class SignUpViewModelState {}

final class SignUpViewModelInitial extends SignUpViewModelState {}
class SignUpLoadingState extends SignUpViewModelState {}
class SignUpSuccessState extends SignUpViewModelState {
  String token;
  SignUpSuccessState(this.token);
}
class SignUpErrorState extends SignUpViewModelState {
  String error;
  SignUpErrorState(this.error);
}

