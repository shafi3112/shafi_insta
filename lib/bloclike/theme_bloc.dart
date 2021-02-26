import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:instagram_basic_feed/bloclike/themecolors.dart';
part 'theme_event.dart';
part 'theme_state.dart' ;

class AppThemeBloc extends Bloc<AppThemeEvent, AppThemeState> {
  AppThemeBloc() : super(AppThemeState(theme: AppTheme.lightTheme));

  @override
  Stream<AppThemeState> mapEventToState(
      AppThemeEvent event,
      ) async* {
    if(event is AppThemeEvent) {
      yield AppThemeState(theme: event.theme);
    }
  }

}