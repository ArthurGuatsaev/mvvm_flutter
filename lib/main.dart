import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_flutter/core/auth/data/blocs/auth/auth_bloc.dart';
import 'package:mvvm_flutter/core/auth/data/repository/local/drift/auth_repository.dart';
import 'package:mvvm_flutter/featers/navigation/bloc/navi_bloc.dart';
import 'package:mvvm_flutter/featers/navigation/service/auto_route/routes.dart';
import 'featers/initialize/get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final di = GetItService();
  await di.setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _router = getIt<AppRouter>();
  @override
  Widget build(BuildContext context) {
    final authR = getIt<AuthRepository>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(authRepository: authR),
        ),
        BlocProvider(
          create: (context) => NaviBloc(),
        ),
      ],
      // child: const MaterialApp(home: HomePage())
      child: MaterialApp.router(routerConfig: _router.config()),
    );
  }
}
