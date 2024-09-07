import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_flutter/pages/home/view_model/home_view_model.dart';

class AccountHome extends StatelessWidget {
  const AccountHome({
    super.key,
    required this.viewModel,
  });

  final BaseHomePageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return switch (viewModel.user) {
      null => IconButton(
          onPressed: viewModel.navigateLogin,
          icon: const Icon(Icons.person),
        ),
      _ => CupertinoButton(
          onPressed: viewModel.navigateLogin,
          child: Text(viewModel.user!.name),
        )
    };
  }
}
