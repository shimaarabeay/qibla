import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qibla/core/app/app_prefs.dart';
import 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final AppPreferences _appPreferences;
  ThemeCubit(this._appPreferences) : super(
    //initial state value
      const ThemeState(
      themeMode: ThemeMode.light,
    ))
  {
    _loadTheme();
  }
  Future<void> _loadTheme() async {
    final savedTheme = await _appPreferences.getThemeMode();

    if (savedTheme != state.themeMode) {
      //  value of state after loading
      emit(state.copyWith(themeMode: savedTheme));
    }
  }

  Future<void> updateTheme(ThemeMode mode) async {
    if (mode == state.themeMode) return;

    await _appPreferences.setThemeMode(mode);
    //  value of state after update
    emit(state.copyWith(themeMode: mode));
  }
  bool isSelected(ThemeMode mode) {
    return state.themeMode == mode;
  }
}