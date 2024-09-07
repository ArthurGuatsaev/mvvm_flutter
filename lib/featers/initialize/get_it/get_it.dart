import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:mvvm_flutter/core/auth/data/repository/local/drift/auth_repository.dart';
import 'package:mvvm_flutter/core/auth/domain/model/user_model.dart';
import 'package:mvvm_flutter/featers/navigation/service/auto_route/routes.dart';
import 'package:mvvm_flutter/featers/preference/drift/service/auth/auth.dart';

final getIt = GetIt.instance;

class GetItService {
  Future<void> setup() async {
    final usrCtr = StreamController<MyUser>();
    getIt.registerSingleton<AppRouter>(AppRouter());
    getIt.registerSingleton<AuthRepository>(await authR(usrCtr));
  }

  FutureOr<AuthRepository> authR(StreamController<MyUser?> usrCtr) async {
    final auth =
        AuthRepository(usrCtr: usrCtr, localService: AuthServiceDrift());
    await auth.getAuth();
    return auth;
  }
}
