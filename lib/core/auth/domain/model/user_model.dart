// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mvvm_flutter/featers/preference/drift/tables/user/user_tables.dart';

class MyUser {
  final String name;
  final String password;
  final String? dateOfBirth;
  final int? age;
  final String? mail;

  MyUser(
      {required this.name,
      this.age,
      this.mail,
      required this.password,
      this.dateOfBirth});
  MyUser.empty(
      {this.name = 'empty',
      this.mail = '',
      this.age = 0,
      this.password = '',
      this.dateOfBirth});
  MyUser.fromDrift(UserItem user)
      : name = user.name,
        password = user.password,
        age = null,
        dateOfBirth = user.dateOfBirth,
        mail = user.mail;

  MyUser copyWith({
    String? name,
    String? password,
    String? dateOfBirth,
    int? age,
    String? mail,
  }) {
    return MyUser(
      name: name ?? this.name,
      password: password ?? this.password,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      age: age ?? this.age,
      mail: mail ?? this.mail,
    );
  }

  @override
  bool operator ==(covariant MyUser other) {
    if (identical(this, other)) return true;
    return other.name == name && other.password == password;
  }
}
