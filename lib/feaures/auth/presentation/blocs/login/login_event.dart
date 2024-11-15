part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginStarted extends LoginEvent {
  final String email;
  final String password;

  LoginStarted(this.email, this.password);
}