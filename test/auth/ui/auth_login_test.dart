import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../app/app_test.dart';

void startLoginTest() async {
  testWidgets('Проверка отрисовки Login Page', (WidgetTester tester) async {
    // запуск тестового runApp
    await tester.pumpWidget(runAppTest());

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
  });
}


    // expect(find.widgetWithIcon(IconButton, Icons.person), findsOneWidget);
