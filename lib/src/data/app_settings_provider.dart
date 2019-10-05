import 'dart:convert';

import 'package:active_edge_developer_exercise/src/model/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsProvider {
  Future<AppSettings> markAppTourViewed(
      SharedPreferences sharedPreferences) async {
    AppSettings appSettings = await fetchAppSettings(sharedPreferences);
    appSettings.hasViewedAppTour = true;
    return await _saveAppSettings(sharedPreferences, appSettings);
  }

  Future<AppSettings> _saveAppSettings(
      SharedPreferences sharedPreferences, AppSettings appSettings) async {
    sharedPreferences.setString(
        'app_settings', json.encode(appSettings.toMap()));

    return appSettings;
  }

  Future<AppSettings> fetchAppSettings(
      SharedPreferences sharedPreferences) async {
    AppSettings appSettings = AppSettings();
    String settingsData = sharedPreferences.getString('app_settings');
    if (settingsData != null && settingsData.length > 0) {
      appSettings = AppSettings.fromJson(
          Map<String, dynamic>.from(json.decode(settingsData)));
    }
//    print(appSettings.totalVisitors.list.elementAt(0).phone_number);
    return appSettings;
  }

  Future<AppSettings> setThemes(
      SharedPreferences sharedPreferences, bool themes) async {
    AppSettings appSettings = await fetchAppSettings(sharedPreferences);
    appSettings.themes = themes;
    return await _saveAppSettings(sharedPreferences, appSettings);
  }
}

final appSettingsProvider = AppSettingsProvider();
