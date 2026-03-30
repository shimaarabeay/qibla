part of 'settings_cubit.dart';

enum LanguageType { english, arabic }
enum ThemeType { light, dark, system }

class SettingsState {
  final LanguageType language;
  final ThemeType theme;

  const SettingsState({
    required this.language,
    required this.theme,
  });

  factory SettingsState.initial() {
    return const SettingsState(
      language: LanguageType.arabic,
      theme: ThemeType.light,
    );
  }

  SettingsState copyWith({
    LanguageType? language,
    ThemeType? theme,
  }) {
    return SettingsState(
      language: language ?? this.language,
      theme: theme ?? this.theme,
    );
  }
}