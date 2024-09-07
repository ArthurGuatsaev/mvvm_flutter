part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String name;
  final String password;
  final String? male;

  SignUpEvent({required this.name, required this.password, this.male});
}

class GetUserEvent extends AuthEvent {
  final MyUser user;

  GetUserEvent({required this.user});
}
