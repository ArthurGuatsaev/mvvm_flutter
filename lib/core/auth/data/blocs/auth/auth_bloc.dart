import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:mvvm_flutter/core/auth/domain/repository/auth_repository.dart';
import '../../../domain/model/user_model.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BaseAuthRepository _authRepository;
  StreamSubscription? _ursSubscription;
  AuthBloc({required BaseAuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthInitial()) {
    on<SignUpEvent>(signUp);
    on<GetUserEvent>(getUser);

    _ursSubscription = _authRepository.usrCtr.stream.listen(
      (event) {
        return switch (event) {
          null => null,
          _ => add(GetUserEvent(user: event)),
        };
      },
    );
  }

  signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(const AuthLoading());
    await Future.delayed(const Duration(seconds: 3));
    _authRepository.signUp(event.name, event.password);
  }

  getUser(GetUserEvent event, Emitter<AuthState> emit) {
    emit(AuthLogin(user: event.user));
  }

  @override
  Future<void> close() {
    _ursSubscription?.cancel();
    _ursSubscription = null;
    return super.close();
  }
}
