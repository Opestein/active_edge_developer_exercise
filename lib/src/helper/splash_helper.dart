import 'dart:async';

import 'package:active_edge_developer_exercise/src/data/app_settings_provider.dart';
import 'package:active_edge_developer_exercise/src/data/app_settings_repo.dart';
import 'package:active_edge_developer_exercise/src/ui/homescreen.dart';
import 'package:active_edge_developer_exercise/src/ui/onboarding_screen/onboardingscreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum AuthStatus { LOGIN }

class SplashHelper {
  BuildContext _authContext;
  http.Client _client;
  SharedPreferences _preferences;

//  doOperation(
//      SharedPreferences preferences,
//      http.Client client,
//      BuildContext context,
//      AuthRequest authRequest,
//      AuthCompleted authCompleted) async {
//    var appSettings = await appSettingsProvider.fetchAppSettings(preferences);
//
//    if (!appSettings.hasViewedAppTour || appSettings.hasViewedAppTour == null) {
//      login(preferences, client, context, authRequest, authCompleted);
//    } else {
//      authCompleted(appSettings.authResponse);
//    }
//  }

//  isSignedIn() async {
//    var _duration = new Duration(seconds: 4);
//
//    getParentSerialNumber().then((result) {
//      if (result != null) {
//        return Timer(_duration, navigationPageLoggedIn(result));
//      } else {
//        return Timer(_duration, navigationPage);
//      }
//    });
//  }

//  isNotSignedIn() async {
//    var _duration = new Duration(seconds: 4);
//
//    return new Timer(_duration, navigationPage);
//  }

  Future checkFirstScreen(
    SharedPreferences preferences,
    http.Client client,
    BuildContext context,
  ) async {
    this._preferences = preferences;
    this._client = client;
    this._authContext = context;

    var appSettings = await appSettingsProvider.fetchAppSettings(_preferences);

    if (appSettings.hasViewedAppTour != null) {
      var _duration = new Duration(seconds: 4);

      Timer(_duration, navigationPageLoggedIn);
    } else {
      appSettingsRepository.markAppTourViewed(_preferences);

      Navigator.pushReplacement(
          _authContext,
          MaterialPageRoute(
            builder: (context) => OnboardingScreen(
              preferences,
              client,
            ),
            settings: const RouteSettings(name: OnboardingScreen.routeName),
          ));
    }
  }

  navigationPageLoggedIn() {
    Navigator.pushReplacement(
      _authContext,
      MaterialPageRoute(
          builder: (context) => HomeScreen(
                _preferences,
                _client,
              )),
    );
  }
}
