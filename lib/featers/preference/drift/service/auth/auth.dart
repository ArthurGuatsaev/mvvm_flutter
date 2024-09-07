import 'dart:async';

import 'package:drift/drift.dart';
import 'package:mvvm_flutter/featers/preference/drift/tables/user/user_tables.dart';
import 'package:mvvm_flutter/featers/preference/preference_service.dart';

import '../drift_service.dart';

class AuthServiceDrift extends DriftService implements PreferenceService {
  @override
  FutureOr<UserItem?> getUserById({required int id}) async {
    return await database!.managers.userItems
        .filter((f) => f.id(id))
        .getSingleOrNull();
  }

  @override
  FutureOr<UserItem?> getUser({required String password}) async {
    return await database!.managers.userItems
        .filter((f) => f.password(password))
        .getSingleOrNull();
  }

  @override
  FutureOr<void> saveUser(
      {required String name, required String password}) async {
    await database!
        .into(database!.userItems)
        .insert(UserItemsCompanion.insert(name: name, password: password));
  }

  /// устанавливает текущего пользователя
  @override
  FutureOr<void> setAuth(UserItem item) async {
    final user = item.copyWith(id: 0, password: 'default${item.password}');
    await database!
        .into(database!.userItems)
        .insert(user, onConflict: DoUpdate((old) => user));
  }

  /// возвращает текущего пользователя или нул
  @override
  FutureOr<UserItem?> getAuth() async => await database!.managers.userItems
      .filter((f) => f.id(0))
      .getSingleOrNull();
}
