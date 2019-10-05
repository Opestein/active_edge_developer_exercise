// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:timbala/src/utils/colors.dart';

class TimbalaTheme {
  const TimbalaTheme._(this.name, this.data);

  final String name;
  final ThemeData data;
}

final TimbalaTheme kDarkGalleryTheme =
    TimbalaTheme._('Dark', _buildDarkTheme());
final TimbalaTheme kLightGalleryTheme =
    TimbalaTheme._('Light', _buildLightTheme());

TextTheme _buildLightTextTheme(TextTheme base) {
  return base
      .copyWith(
        title:
            base.title.copyWith(fontFamily: 'CircularStd', color: Colors.black),
        subhead: base.title.copyWith(
            color: Colors.black,
            fontFamily: 'CircularStd',
            fontStyle: FontStyle.normal),
        button: base.title.copyWith(
            color: Colors.black,
            fontFamily: 'CircularStd',
            fontStyle: FontStyle.normal),
        display1: base.title.copyWith(
            color: Colors.black,
            fontFamily: 'CircularStd',
            fontStyle: FontStyle.normal),
        body1: base.title.copyWith(
            color: Colors.black,
            fontFamily: 'CircularStd',
            fontStyle: FontStyle.normal),
        body2: base.title.copyWith(
            color: Colors.black,
            fontFamily: 'CircularStd',
            fontStyle: FontStyle.normal),
        display2: base.title.copyWith(
            color: Colors.black,
            fontFamily: 'CircularStd',
            fontStyle: FontStyle.normal),
        display3: base.title.copyWith(
            color: Colors.black,
            fontFamily: 'CircularStd',
            fontStyle: FontStyle.normal),
        display4: base.title.copyWith(
            color: Colors.black,
            fontFamily: 'CircularStd',
            fontStyle: FontStyle.normal),
        headline: base.title.copyWith(
            color: Colors.black,
            fontFamily: 'CircularStd',
            fontStyle: FontStyle.normal),
        overline: base.title.copyWith(
            color: Colors.black,
            fontFamily: 'CircularStd',
            fontStyle: FontStyle.normal),
        subtitle: base.title.copyWith(
            color: Colors.black,
            fontFamily: 'CircularStd',
            fontStyle: FontStyle.normal),
        caption: base.title.copyWith(
            color: Colors.black,
            fontFamily: 'CircularStd',
            fontStyle: FontStyle.normal),
      )
      .apply(
        bodyColor: Colors.black,
      );
}

TextTheme _buildDarkTextTheme(TextTheme base) {
  return base.copyWith(
      title: base.title
          .copyWith(fontFamily: 'CircularStd', fontStyle: FontStyle.normal),
      subhead: base.title.copyWith(
          color: white, fontFamily: 'CircularStd', fontStyle: FontStyle.normal),
      button: base.title.copyWith(
          color: white, fontFamily: 'CircularStd', fontStyle: FontStyle.normal),
      display1: base.title.copyWith(
          color: white, fontFamily: 'CircularStd', fontStyle: FontStyle.normal),
      body1: base.title.copyWith(
          color: white, fontFamily: 'CircularStd', fontStyle: FontStyle.normal),
      body2: base.title.copyWith(
          color: white, fontFamily: 'CircularStd', fontStyle: FontStyle.normal),
      display2: base.title.copyWith(
          color: white, fontFamily: 'CircularStd', fontStyle: FontStyle.normal),
      display3: base.title.copyWith(
          color: white, fontFamily: 'CircularStd', fontStyle: FontStyle.normal),
      display4: base.title.copyWith(
          color: white, fontFamily: 'CircularStd', fontStyle: FontStyle.normal),
      headline: base.title.copyWith(
          color: white, fontFamily: 'CircularStd', fontStyle: FontStyle.normal),
      overline: base.title.copyWith(
          color: white, fontFamily: 'CircularStd', fontStyle: FontStyle.normal),
      subtitle: base.title.copyWith(
          color: white, fontFamily: 'CircularStd', fontStyle: FontStyle.normal),
      caption: base.title.copyWith(
          color: white,
          fontFamily: 'CircularStd',
          fontStyle: FontStyle.normal));
}

ThemeData _buildDarkTheme() {
//  const Color primaryColor = Color(0xFF0175c2);
//  const Color secondaryColor = Color(0xFF13B9FD);
  final ColorScheme colorScheme = const ColorScheme.dark().copyWith(
    primary: black87Color,
    secondary: black87Color,
  );
  final ThemeData base = ThemeData(
      brightness: Brightness.dark,
      accentColorBrightness: Brightness.dark,
      primaryColor: primaryDarkColor,
      primaryColorDark: primaryDarkColor,
      primaryColorLight: primaryDarkColor,
      buttonColor: secondaryDarkColor,
      indicatorColor: Colors.white,
      toggleableActiveColor: secondaryDarkColor,
      accentColor: secondaryDarkColor,
      splashColor: secondaryDarkColorTrans,
      splashFactory: InkRipple.splashFactory,
      canvasColor: const Color(0xFF202124),
      scaffoldBackgroundColor: const Color(0xFF202124),
      backgroundColor: const Color(0xFF202124),
      errorColor: const Color(0xFFB00020),
      inputDecorationTheme:
          InputDecorationTheme(labelStyle: TextStyle(color: Colors.white)),
      iconTheme: IconThemeData(
        color: accentDarkColor,
      ),
      buttonTheme: ButtonThemeData(
          colorScheme: colorScheme,
          textTheme: ButtonTextTheme.primary,
          buttonColor: secondaryDarkColor),
      cardColor: textFieldColor,
      textSelectionColor: Colors.white);
  return base.copyWith(
    textTheme: _buildDarkTextTheme(base.textTheme),
    primaryTextTheme: _buildDarkTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildDarkTextTheme(base.accentTextTheme),
    primaryIconTheme: base.primaryIconTheme.copyWith(
      color: secondaryDarkColor,
    ),
  );
}

ThemeData _buildLightTheme() {
  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
    brightness: Brightness.light,
    accentColorBrightness: Brightness.light,
    colorScheme: colorScheme,
    primaryColor: Colors.white,
    buttonColor: secondaryColor,
    indicatorColor: Colors.black,
    toggleableActiveColor: secondaryColor,
    splashColor: secondaryColorTrans,
    splashFactory: InkRipple.splashFactory,
    accentColor: secondaryColor,
    canvasColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Colors.white,
    errorColor: const Color(0xFFB00020),
    accentIconTheme: IconThemeData(color: secondaryColor),
    primaryIconTheme: IconThemeData(
      color: secondaryColor,
    ),
    iconTheme: IconThemeData(
      color: secondaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: TextStyle(color: Colors.black),
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.normal,
        buttonColor: secondaryColor),
    cardColor: textFieldColor,
    textSelectionColor: Colors.black45,
  );
  return base.copyWith(
    textTheme: _buildLightTextTheme(base.textTheme),
    primaryTextTheme: _buildLightTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildLightTextTheme(base.accentTextTheme),
    primaryIconTheme: base.primaryIconTheme.copyWith(
      color: secondaryColor,
    ),
  );
}
