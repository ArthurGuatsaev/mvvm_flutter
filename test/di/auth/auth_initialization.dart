import 'dart:async';
import 'package:mocktail/mocktail.dart';
import 'package:mvvm_flutter/core/auth/data/repository/local/drift/auth_repository.dart';
import 'package:mvvm_flutter/core/auth/domain/model/user_model.dart';
import 'package:mvvm_flutter/featers/preference/drift/tables/user/user_tables.dart';
import 'package:mvvm_flutter/featers/preference/preference_service.dart';

AuthRepository authRepositoryInit() {
  final mockLocalService = MockLocalService();
  const usr = UserItem(id: 0, name: 'name', password: 'password');
  when(() => mockLocalService.getUser(password: 'password')).thenReturn(usr);
  when(() => mockLocalService.getUserById(id: 0)).thenReturn(usr);
  when(() => mockLocalService.getAuth()).thenReturn(usr);
  final usrCtr = StreamController<MyUser>.broadcast();
  return AuthRepository(usrCtr: usrCtr, localService: mockLocalService);
}

class MockLocalService extends Mock implements PreferenceService {}
