import 'package:flutter/material.dart';
import 'package:mvvm_flutter/core/auth/domain/model/user_model.dart';
import 'package:mvvm_flutter/featers/navigation/bloc/navi_bloc.dart';

import '../../../core/auth/data/blocs/auth/auth_bloc.dart';

abstract class BaseHomePageViewModel {
  final AuthBloc authBlock;
  final NaviBloc naviBloc;
  final BuildContext context;

  BaseHomePageViewModel({
    required this.authBlock,
    required this.naviBloc,
    required this.context,
  });
  AuthState get authState => authBlock.state;
  NaviState get naviState => naviBloc.state;
  MyUser? get user => authState.user;

  void navigateLogin() => naviBloc.add(PushLoginEvent());
  void navigateHome() => naviBloc.add(PushHomeEvent());
}
