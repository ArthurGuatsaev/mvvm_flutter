// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:mvvm_flutter/pages/home/view/home_page.dart' as _i2;
import 'package:mvvm_flutter/pages/home/view/widgets/screens/phone/home.dart'
    as _i1;
import 'package:mvvm_flutter/pages/home/view_model/home_view_model.dart' as _i6;
import 'package:mvvm_flutter/pages/login/view/login_page.dart' as _i3;

/// generated route for
/// [_i1.AppHome]
class AppHome extends _i4.PageRouteInfo<AppHomeArgs> {
  AppHome({
    _i5.Key? key,
    required _i6.BaseHomePageViewModel viewModel,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          AppHome.name,
          args: AppHomeArgs(
            key: key,
            viewModel: viewModel,
          ),
          initialChildren: children,
        );

  static const String name = 'AppHome';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppHomeArgs>();
      return _i1.AppHome(
        key: args.key,
        viewModel: args.viewModel,
      );
    },
  );
}

class AppHomeArgs {
  const AppHomeArgs({
    this.key,
    required this.viewModel,
  });

  final _i5.Key? key;

  final _i6.BaseHomePageViewModel viewModel;

  @override
  String toString() {
    return 'AppHomeArgs{key: $key, viewModel: $viewModel}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomePage();
    },
  );
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i4.PageRouteInfo<void> {
  const LoginRoute({List<_i4.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i3.LoginPage();
    },
  );
}
