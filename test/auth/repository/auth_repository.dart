import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_flutter/core/auth/data/repository/local/drift/auth_repository.dart';
import 'package:mvvm_flutter/core/auth/domain/model/user_model.dart';

void authRepositoryTesting(AuthRepository authR) {
  group(
    'проверка методов аутентификации юзера',
    () {
      test('проверка получения юзера после запуска приложения', () async {
        expectLater(authR.usrCtr.stream,
            emitsInOrder([MyUser(name: 'name', password: 'password')]));
        await authR.getAuth();
      });
      test('проверка регистрации юзера', () async {
        expectLater(authR.usrCtr.stream,
            emitsInOrder([MyUser(name: 'name', password: 'password')]));
        await authR.signUp('name', 'password');
      });
      test('проверка входа юзера', () async {
        expectLater(authR.usrCtr.stream,
            emitsInOrder([MyUser(name: 'name', password: 'password')]));
        await authR.signIn('name', 'password');
      });
    },
  );
}
