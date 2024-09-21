part of 'sign_in_veiw_model_cubit.dart';

@immutable
sealed class SignInViewModelState {}

final class SignInViewModelInitial extends SignInViewModelState {}
class SignInViewModelLoading extends SignInViewModelState {}
class SignInViewModelSuccess extends SignInViewModelState {
  AuthEntity authEntity ;
  SignInViewModelSuccess(this.authEntity);
}
class SignInViewModelError extends SignInViewModelState {
  String error ;
  SignInViewModelError(this.error);
}