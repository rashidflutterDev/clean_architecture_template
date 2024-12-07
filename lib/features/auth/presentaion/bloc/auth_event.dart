part of 'auth_bloc.dart';

sealed class AuthEvents {}

class AuthSignInEvent extends AuthEvents {
  final String email;
  final String password;
  AuthSignInEvent({required this.email, required this.password});
}

class AuthSignUpEvent extends AuthEvents {
  final String name;
  final String email;
  final String password;
  AuthSignUpEvent(
      {required this.name, required this.email, required this.password});
}
