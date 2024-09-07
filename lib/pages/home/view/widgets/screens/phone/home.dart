import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../../../../view_model/home_view_model.dart';
import '../../account/account.dart';

@RoutePage()
class AppHome extends StatelessWidget {
  final BaseHomePageViewModel viewModel;
  const AppHome({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
        actions: [
          AccountHome(viewModel: viewModel),
        ],
      ),
      body: const Column(),
    );
  }
}
