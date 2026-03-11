
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:qibla/core/app/di.dart';

import '../presentation/resources/language_manager.dart';

const String PREFS_KEY_LANG = 'PREFS_KEY_LANG';
const String PREFS_KEY_IS_LOGGED_IN = 'PREFS_KEY_IS_LOGGED_IN';
const String PREFS_KEY_NAME = 'PREFS_KEY_NAME';
const String PREFS_KEY_PATH = 'PREFS_KEY_PATH';
const String PREFS_KEY_ONBOARDONG_VIEWED = "PREFS_KEY_ONBOARDONG_VIEWED";
const String PREFS_KEY_FIRST_SPLASH_VIEWED = "PREFS_KEY_FIRST_SPLASH_VIEWED";
const String PREFS_KEY_CURRENT_COUNTRY = "PREFS_KEY_CURRENT_COUNTRY";
const String USER_DATA = "USER_DATA";
const String DEFAULT_CURRENCY = "AR";
const String PREFS_KEY_USER_TOPIC = "PREFS_KEY_USER_TOPIC";
const String PREFS_KEY_ID = "PREFS_KEY_ID";
const String PREFS_KEY_CONFIRM_REG_CODE = "PREFS_KEY_CONFIRM_REG_CODE";
const String PREFS_KEY_DEVICE_NOTIFICATION_LAST_SENT =
    "PREFS_KEY_DEVICE_NOTIFICATION_LAST_SENT";

// User Data – used in secure storage
const String TOKEN = 'TOKEN';
const String AUTH_FLOW_STATE = 'AUTH_FLOW_STATE';

class AppPreferences {
  final FlutterSecureStorage _secureStorage;

  AppPreferences(this._secureStorage);



  Future<void> _writeString(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String> _readString(String key, {String defaultValue = ""}) async {
    final v = await _secureStorage.read(key: key);
    return v ?? defaultValue;
  }

  Future<void> _writeBool(String key, bool value) async {
    await _secureStorage.write(key: key, value: value ? 'true' : 'false');
  }

  Future<bool> _readBool(String key, {bool defaultValue = false}) async {
    final v = await _secureStorage.read(key: key);
    if (v == null) return defaultValue;
    return v == 'true';
  }

  Future<void> _writeInt(String key, int value) async {
    await _secureStorage.write(key: key, value: value.toString());
  }

  Future<int> _readInt(String key, {int defaultValue = -1}) async {
    final v = await _secureStorage.read(key: key);
    if (v == null) return defaultValue;
    return int.tryParse(v) ?? defaultValue;
  }

  //================== LANGUAGE ==================//

  Future<String> getAppLanguage() async {
    String language = await _readString(PREFS_KEY_LANG);
    if (language.isNotEmpty) {
      return language;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      // set english
      await _writeString(
        PREFS_KEY_LANG,
        LanguageType.ENGLISH.getValue(),
      );
    } else {
      // set arabic
      await _writeString(
        PREFS_KEY_LANG,
        LanguageType.ARABIC.getValue(),
      );
    }
  }

  Future<void> customChangeAppLanguage(String language) async {
    await _writeString(PREFS_KEY_LANG, language);
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();
    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }

  //================== USER BASIC DATA ==================//

  Future<void> setUserName(String name) async {
    await _writeString(PREFS_KEY_NAME, name);
  }

  Future<String> getUserName() async {
    return _readString(PREFS_KEY_NAME, defaultValue: '');
  }

  Future<void> setOnBoardingViewed(bool isView) async {
    await _writeBool(PREFS_KEY_ONBOARDONG_VIEWED, isView);
  }

  Future<bool> getOnBoardingViewed() async {
    return _readBool(PREFS_KEY_ONBOARDONG_VIEWED, defaultValue: false);
  }

  Future<void> setUserTopic(String topic) async {
    await _writeString(PREFS_KEY_USER_TOPIC, topic);
  }

  Future<String> getUserTopic() async {
    return _readString(PREFS_KEY_USER_TOPIC, defaultValue: '');
  }

  Future<void> setUserId(int id) async {
    await _writeInt(PREFS_KEY_ID, id);
  }

  Future<int> getUserId() async {
    return _readInt(PREFS_KEY_ID, defaultValue: -1);
  }

  Future<void> setDeviceNotificationLastSentAt(int timestamp) async {
    await _writeInt(PREFS_KEY_DEVICE_NOTIFICATION_LAST_SENT, timestamp);
  }

  Future<int> getDeviceNotificationLastSentAt() async {
    return _readInt(PREFS_KEY_DEVICE_NOTIFICATION_LAST_SENT, defaultValue: -1);
  }

  Future<void> setUserImagePath(String path) async {
    await _writeString(PREFS_KEY_PATH, path);
  }

  Future<String> getUserImagePath() async {
    return _readString(PREFS_KEY_PATH, defaultValue: '');
  }

  Future<void> setUserLoggedIn(bool isLogin) async {
    await _writeBool(PREFS_KEY_IS_LOGGED_IN, isLogin);
  }

  Future<bool> isUserLoggedIn() async {
    return _readBool(PREFS_KEY_IS_LOGGED_IN, defaultValue: false);
  }

  //================== SECURE USER TOKEN ==================//

  /// Save token securely
  Future<void> setUserToken(String token) async {
    await _writeString(TOKEN, token);
  }

  /// Get token securely
  Future<String> getUserToken() async {
    return _readString(TOKEN, defaultValue: "");
  }

  //================== AUTH FLOW (OTP persistence) ==================//

  Future<void> setAuthFlowState(String json) async {
    await _writeString(AUTH_FLOW_STATE, json);
  }

  Future<String> getAuthFlowState() async {
    return _readString(AUTH_FLOW_STATE, defaultValue: '');
  }

  Future<void> clearAuthFlowState() async {
    await _secureStorage.delete(key: AUTH_FLOW_STATE);
    await _secureStorage.delete(key: PREFS_KEY_CONFIRM_REG_CODE);
  }

  Future<void> setConfirmRegistrationCode(String code) async {
    final value = code.trim();
    if (value.isEmpty) {
      await _secureStorage.delete(key: PREFS_KEY_CONFIRM_REG_CODE);
      return;
    }
    await _writeString(PREFS_KEY_CONFIRM_REG_CODE, value);
  }

  Future<String> getConfirmRegistrationCode() async {
    return _readString(PREFS_KEY_CONFIRM_REG_CODE, defaultValue: '');
  }

  Future<void> clearConfirmRegistrationCode() async {
    await _secureStorage.delete(key: PREFS_KEY_CONFIRM_REG_CODE);
  }

  //================== LOGOUT ==================//

  Future<void> logout() async {
    await resetModules();

    await HydratedBloc.storage.clear();

    const keysToDelete = <String>[
      TOKEN,
      USER_DATA,
      PREFS_KEY_IS_LOGGED_IN,
      PREFS_KEY_NAME,
      PREFS_KEY_PATH,
      PREFS_KEY_USER_TOPIC,
      PREFS_KEY_ID,
      AUTH_FLOW_STATE,
      PREFS_KEY_CONFIRM_REG_CODE,
    ];


  }



}
