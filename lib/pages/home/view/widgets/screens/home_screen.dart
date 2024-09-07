import 'package:flutter/material.dart';

import '../../../view_model/home_view_model.dart';
import 'phone/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.viewModel});

  final BaseHomePageViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return switch (constraints.maxWidth) {
          < 450 => AppHome(viewModel: viewModel),
          _ => AppHome(viewModel: viewModel),
        };
      },
    );
  }
}
