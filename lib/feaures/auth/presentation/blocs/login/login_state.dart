part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final SignInResponseDto account;

  LoginSuccess(this.account);
}

final class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);
}
