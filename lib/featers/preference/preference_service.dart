import 'dart:async';

import 'drift/tables/user/user_tables.dart';

abstract class PreferenceService {
  FutureOr<UserItem?> getUserById({required int id});

  /// метод входа по логину и паролю
  FutureOr<UserItem?> getUser({required String password});

  /// метод регистрации по логину и паролю
  FutureOr<void> saveUser({required String name, required String password});

  /// устанавливает текущего пользователя
  FutureOr<void> setAuth(UserItem item);

  /// возвращает текущего пользователя или нул
  FutureOr<UserItem?> getAuth();
}
