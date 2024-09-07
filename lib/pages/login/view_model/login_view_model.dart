import '../../../core/auth/data/blocs/auth/auth_bloc.dart';

abstract class BaseLoginPageViewModel {
  final AuthBloc authBlock;
  BaseLoginPageViewModel({
    required this.authBlock,
  });
  AuthState get authState => authBlock.state;

  void signUp(String name, String password);
}
