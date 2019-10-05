import 'package:flutter/material.dart';

class AppSettings {
  bool hasViewedAppTour;
  Locale language;

  bool themes;

  AppSettings({
    this.hasViewedAppTour = false,
    this.language,
    this.themes = false,
  });

  factory AppSettings.fromJson(Map<String, dynamic> data) => new AppSettings(
        hasViewedAppTour: data['hasViewedAppTour'] ?? false,

        themes: data['themes'] ?? false,
//        loginRequest: data["login"] == null
//            ? LoginRequest(rememberMe: false)
//            : LoginRequest.fromMap(data["login"]),
      );

  Map<String, dynamic> toMap() => {
        'hasViewedAppTour': hasViewedAppTour == null ? false : hasViewedAppTour,
        'themes': themes == null ? false : themes,
      };
}
