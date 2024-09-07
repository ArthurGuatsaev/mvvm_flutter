part of 'auth_bloc.dart';

@immutable
sealed class AuthState {
  final MyUser? user;
  final AuthStatus status;
  bool get isLoading => status == AuthStatus.loading;
  const AuthState({this.user, this.status = AuthStatus.initial});
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLogin extends AuthState {
  const AuthLogin({required super.user, super.status = AuthStatus.success});
}

final class AuthLoading extends AuthState {
  const AuthLoading({super.status = AuthStatus.loading});
}

enum AuthStatus {
  loading,
  initial,
  success,
}
