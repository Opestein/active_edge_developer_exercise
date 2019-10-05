import 'package:active_edge_developer_exercise/src/data/app_settings_provider.dart';
import 'package:active_edge_developer_exercise/src/model/app_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsRepository {
//  final AppSettingsProvider _appSettingsProvider = AppSettingsProvider();

  Future<AppSettings> fetchAppSettings(
          SharedPreferences sharedPreferences) async =>
      appSettingsProvider.fetchAppSettings(sharedPreferences);

  Future<AppSettings> markAppTourViewed(
          SharedPreferences sharedPreferences) async =>
      appSettingsProvider.markAppTourViewed(sharedPreferences);

  Future<AppSettings> setThemes(
          SharedPreferences sharedPreferences, bool themes) async =>
      appSettingsProvider.setThemes(sharedPreferences, themes);
}

final appSettingsRepository = AppSettingsRepository();
