import 'package:flutter/material.dart';
import 'package:mvvm_flutter/pages/login/view_model/login_view_model.dart';

import 'phone/login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.viewModel});

  final BaseLoginPageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return switch (constraints.maxWidth) {
          < 450 => AppLogin(viewModel: viewModel),
          _ => AppLogin(viewModel: viewModel),
        };
      },
    );
  }
}
