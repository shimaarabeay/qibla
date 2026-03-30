import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState.initial());

  void changeLanguage(LanguageType language) {
    emit(state.copyWith(language: language));
  }

}