// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:mvvm_flutter/featers/preference/drift/tables/user/user_tables.dart';

import '../model/user_model.dart';

abstract class BaseAuthRepository {
  final StreamController<MyUser?> usrCtr;
  BaseAuthRepository({required this.usrCtr});

  MyUser? user;
  MyUser get currentUser => user == null ? MyUser.empty() : user!;
  Future<void> signUp(String name, String password);

  Future<void> delete();

  Future<void> signIn(String name, String password);

  Future<void> getAuth();
  Future<void> setAuth(UserItem user);
}
