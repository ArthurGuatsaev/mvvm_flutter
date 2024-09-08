import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:mvvm_flutter/core/auth/data/repository/local/drift/auth_repository.dart';

import 'auth/auth_initialization.dart';

final getItTest = GetIt.instance;

class GetItServiceTest {
  Future<void> setupTest() async {
    getItTest.registerSingleton<AuthRepository>(authRepositoryInit());
  }
}
