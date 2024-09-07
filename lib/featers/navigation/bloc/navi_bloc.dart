import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mvvm_flutter/featers/initialize/get_it/get_it.dart';
import 'package:mvvm_flutter/featers/navigation/service/auto_route/routes.dart';
import 'package:mvvm_flutter/featers/navigation/service/auto_route/routes.gr.dart';

part 'navi_event.dart';
part 'navi_state.dart';

class NaviBloc extends Bloc<NaviEvent, NaviState> {
  NaviBloc() : super(NaviInitial()) {
    on<PushLoginEvent>(pushLogin);
    on<PushHomeEvent>(pushHome);
  }
  AppRouter get _appRouter => getIt<AppRouter>();

  pushLogin(PushLoginEvent event, Emitter<NaviState> emit) =>
      _appRouter.push(const LoginRoute());

  pushHome(PushHomeEvent event, Emitter<NaviState> emit) =>
      _appRouter.replaceAll([const HomeRoute()], updateExistingRoutes: true);
}
