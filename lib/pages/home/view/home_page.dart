import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_flutter/featers/navigation/bloc/navi_bloc.dart';
import '../../../core/auth/data/blocs/auth/auth_bloc.dart';
import '../view_model/view_model_mans/view_model_men.dart';
import 'widgets/screens/home_screen.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listenWhen: (previous, current) => previous.user != current.user,
      listener: (context, state) {
        if (state.user != null) {
          context.read<NaviBloc>().add(PushHomeEvent());
        }
      },
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final authbloc = context.read<AuthBloc>();
          final navibloc = context.read<NaviBloc>();
          final viewModel = switch (state.user?.mail) {
            _ => HomePageViewModelDefault(
                authBlock: authbloc, naviBloc: navibloc, context: context),
          };
          return HomeScreen(viewModel: viewModel);
        },
      ),
    );
  }
}
