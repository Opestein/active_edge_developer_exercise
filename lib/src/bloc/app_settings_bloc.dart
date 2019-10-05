import 'package:active_edge_developer_exercise/src/data/app_settings_repo.dart';
import 'package:active_edge_developer_exercise/src/model/app_settings.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _AppSettingsBloc {
  BehaviorSubject<AppSettings> _appSettingsStreamController =
      BehaviorSubject<AppSettings>();
//  BehaviorSubject<AppSettings> get _inAdd => _appSettingsStreamController.sink;
  BehaviorSubject<AppSettings> get appSettings =>
      _appSettingsStreamController.stream;

  void dispose() => _appSettingsStreamController.close();

  fetchAppSettings(SharedPreferences preferences) async {
    try {
      var preferences = await SharedPreferences.getInstance();
      var appSettings =
          await appSettingsRepository.fetchAppSettings(preferences);

      _appSettingsStreamController.sink.add(appSettings);
    } catch (e) {
      _appSettingsStreamController.sink.addError(e);
    }

    return appSettings;
  }

  markAppTourViewed(SharedPreferences preferences) async {
    var saved = await appSettingsRepository.markAppTourViewed(preferences);
    _appSettingsStreamController.sink.add(saved);
  }

  setThemes(SharedPreferences preferences, bool themes) async {
    var saved = await appSettingsRepository.setThemes(preferences, themes);
    _appSettingsStreamController.sink.add(saved);
  }
}

final appSettingsBloc = _AppSettingsBloc();
