part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

class RegisterStarted extends RegisterEvent {
  final String username;
  final String email;
  final String password;

  RegisterStarted(this.username, this.email, this.password);
}
