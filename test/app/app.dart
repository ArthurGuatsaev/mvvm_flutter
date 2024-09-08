import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_flutter/core/auth/data/blocs/auth/auth_bloc.dart';
import 'package:mvvm_flutter/core/auth/data/repository/local/drift/auth_repository.dart';
import 'package:mvvm_flutter/featers/navigation/bloc/navi_bloc.dart';
import 'package:mvvm_flutter/pages/login/view/login_page.dart';

import '../di/get_it.dart';

MaterialApp runAppTest() {
  return MaterialApp(
    home: MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AuthBloc(authRepository: getItTest<AuthRepository>()),
        ),
        BlocProvider(
          create: (context) => NaviBloc(),
        ),
      ],
      child: const LoginPage(),
    ),
  );
}
