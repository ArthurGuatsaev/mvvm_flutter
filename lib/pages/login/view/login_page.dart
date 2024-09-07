import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/auth/data/blocs/auth/auth_bloc.dart';
import '../view_model/view_model_mans/view_model_men.dart';
import '../view_model/view_model_womans/view_model_woman.dart';
import 'widgets/screens/login_screen.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final viewModel = switch (state.user?.mail) {
          'woman' => LoginPageViewModelWoman(authBlock: bloc),
          _ => LoginPageViewModelMan(authBlock: bloc),
        };
        return LoginScreen(viewModel: viewModel);
      },
    );
  }
}
