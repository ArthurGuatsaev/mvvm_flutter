import 'package:mvvm_flutter/core/auth/domain/model/user_model.dart';
import 'package:mvvm_flutter/featers/preference/drift/tables/user/user_tables.dart';
import '../../../../../../featers/preference/preference_service.dart';
import '../../../../domain/repository/auth_repository.dart';

class AuthRepository extends BaseAuthRepository {
  AuthRepository({required super.usrCtr, required this.localService});

  final PreferenceService localService;

  /// получаем текущего юзера либо нулл
  @override
  Future<void> getAuth() async {
    final usr = await localService.getAuth();
    sendUser(usr);
  }

  @override
  Future<void> setAuth(UserItem user) async {
    await localService.setAuth(user);
    await getAuth();
  }

  @override
  Future<void> delete() {
    throw UnimplementedError();
  }

  @override
  Future<void> signIn(String name, String password) async {
    final usr = await localService.getUser(password: password);
    if (usr != null) await setAuth(usr);
  }

  @override
  Future<void> signUp(String name, String password) async {
    await localService.saveUser(name: name, password: password);
    final usr = await localService.getUser(password: password);
    if (usr != null) await setAuth(usr);
  }

  void sendUser(UserItem? usr) {
    if (usr == null) throw UnimplementedError();
    user = MyUser.fromDrift(usr);
    usrCtr.add(user);
  }
}
