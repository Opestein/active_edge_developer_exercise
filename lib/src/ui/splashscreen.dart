import 'package:active_edge_developer_exercise/src/helper/splash_helper.dart';
import 'package:active_edge_developer_exercise/src/utils/assets.dart';
import 'package:active_edge_developer_exercise/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

ThemeData buildThemeData() {
  final baseTheme = ThemeData.light();

  return baseTheme.copyWith(
      primaryColor: primaryColor, primaryColorLight: primaryColor);
}

class SplashScreen extends StatefulWidget {
  final SharedPreferences preferences;
  final http.Client client;

  SplashScreen(
    this.preferences,
    this.client,
  );

  @override
  State createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin, SplashHelper {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  bool isLoading = false;
  bool isLoggedIn = false;

  SharedPreferences sharedPreferences;
  String phone;

  @override
  void initState() {
    super.initState();

    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 2),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });

    checkFirstScreen(
      widget.preferences,
      widget.client,
      context,
    );
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor:
            Colors.white //or set color with: Color(0xFF0000FF)
        ));

    MediaQueryData mediaQuery;
    mediaQuery = MediaQuery.of(context);

    var shortestSide = mediaQuery.size.shortestSide;
// Determine if we should use mobile layout or not. The
// number 600 here is a common breakpoint for a typical
// 7-inch tablet.
    final bool useMobileLayout = shortestSide < 600;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image.asset(Assets.logo),
        ),
      ),
    );
  }
}
