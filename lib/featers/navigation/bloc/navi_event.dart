part of 'navi_bloc.dart';

@immutable
sealed class NaviEvent {}

class PushLoginEvent extends NaviEvent {}

class PushHomeEvent extends NaviEvent {}
