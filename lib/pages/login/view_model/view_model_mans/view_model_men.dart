import 'dart:developer';
import '../../../../core/auth/data/blocs/auth/auth_bloc.dart';
import '../login_view_model.dart';

class LoginPageViewModelMan extends BaseLoginPageViewModel {
  LoginPageViewModelMan({required super.authBlock});

  @override
  void signUp(String name, String password) {
    log('Man');
    authBlock.add(SignUpEvent(name: name, password: password));
  }
}
