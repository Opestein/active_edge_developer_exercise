// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:active_edge_developer_exercise/src/app.dart';
import 'package:active_edge_developer_exercise/src/application.dart';
import 'package:active_edge_developer_exercise/src/ui/settings/widget/option/options.dart';
import 'package:active_edge_developer_exercise/src/ui/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TimbalaHome extends StatefulWidget {
  final SharedPreferences preferences;
  final http.Client client;

  const TimbalaHome(this.preferences, this.client, {Key key

//    this.testMode = false,
//    this.optionsPage,
      })
      : super(key: key);

//  final Widget optionsPage;
//  final bool testMode;

  // In checked mode our MaterialApp will show the default "debug" banner.
  // Otherwise show the "preview" banner.
  static bool showPreviewBanner = true;

  @override
  _TimbalaHomeState createState() => _TimbalaHomeState();
}

class _TimbalaHomeState extends State<TimbalaHome> {
  SettingOptions options;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    final provider = TimbalaApp.of(context);

    options = provider.options;
    return MaterialApp(
        theme: options.theme.data.copyWith(),
        title: 'Timbala',
        color: Colors.grey,
        debugShowCheckedModeBanner: false,
        navigatorObservers: [
//        FirebaseAnalyticsObserver(analytics: analytics),
        ],
        localizationsDelegates: [
          options.appTranslationsDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: application.supportedLocales(),
        builder: (BuildContext context, Widget child) {
          return Directionality(
            textDirection: options.textDirection,
            child: provider.applyTextScaleFactor(
                // Specifically use a blank Cupertino theme here and do not transfer
                // over the Material primary color etc except the brightness to
                // showcase standard iOS looks.
                CupertinoTheme(
              data: CupertinoThemeData(
                brightness: options.theme.data.brightness,
              ),
              child: child,
            )),
          );
        },
        home: SplashScreen(
          widget.preferences,
          widget.client,
        )

//      ),
        );
  }
}
