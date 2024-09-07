import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mvvm_flutter/featers/initialize/get_it/get_it.dart';
import 'package:mvvm_flutter/main.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('должен регистрировать пользователя по нажатию на кнопку регистрации',
      () {
    testWidgets('Заполнение полей ввода', (tester) async {
      final di = GetItService();
      await di.setup();
      await tester.pumpWidget(MyApp());
      // переход на страницу с регистрацией
      await tester.pump(const Duration(seconds: 2));
      final accountButton = find.byType(IconButton);
      // expect(find.byType(CupertinoButton), findsOneWidget);
      expect(find.widgetWithIcon(IconButton, Icons.person), findsOneWidget);
      await tester.tap(accountButton);
      await tester.pump(const Duration(seconds: 2));

      // имитация нажатия на кнопку регистрации без данных в полях
      final button = find.byType(ElevatedButton);
      expect(find.byType(CircularProgressIndicator), findsNothing);
      await tester.tap(button);

      // проверка на отказ начала процесса регистрации
      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(CircularProgressIndicator), findsNothing);

      // ввод данных в текстовые поля
      expect(find.byType(TextField), findsNWidgets(2));
      final nameTF = find.byType(TextField).first;
      await tester.enterText(nameTF, 'user testerov');
      final passwordTF = find.byType(TextField).last;
      await tester.enterText(passwordTF, 'password');

      // имитация нажатия на кнопку регистрации
      expect(find.byType(CircularProgressIndicator), findsNothing);
      await tester.tap(button);

      // проверка начала процесса регистрации юзера и смены состояния
      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      // проверка завершения регистрации юзера и смены состояния
      await tester.pump(const Duration(seconds: 5));
      expect(find.byType(CircularProgressIndicator), findsNothing);
      expect(find.byType(CupertinoButton), findsOne);
    });
  });
}
