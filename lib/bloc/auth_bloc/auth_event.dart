part of 'auth_bloc.dart';

abstract class AuthEvent {}

class AuthInitEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String email;
  final String password;
  final String? name;
  AuthLoginEvent({required this.email, required this.password, this.name});
}

class AuthLogoutEvent extends AuthEvent {}

