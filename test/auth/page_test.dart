import 'package:mvvm_flutter/core/auth/data/repository/local/drift/auth_repository.dart';
import '../di/get_it.dart';
import 'repository/auth_repository.dart';
import 'ui/auth_login.dart';

void main() {
  final di = GetItServiceTest();
  // инициализация DI
  di.setupTest();
  // запуск тестов репозитория
  authRepositoryTesting(getItTest<AuthRepository>());
  // запуск тестов смены состояния Login виджета
  startLoginTest();
}
