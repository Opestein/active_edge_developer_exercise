import 'package:active_edge_developer_exercise/src/app.dart';
import 'package:active_edge_developer_exercise/src/bloc/app_settings_bloc.dart';
import 'package:active_edge_developer_exercise/src/model/app_settings.dart';
import 'package:active_edge_developer_exercise/src/ui/settings/widget/header/header_items.dart';
import 'package:active_edge_developer_exercise/src/ui/settings/widget/option/option_items.dart';
import 'package:active_edge_developer_exercise/src/ui/settings/widget/option/options.dart';
import 'package:active_edge_developer_exercise/src/utils/app_utilities.dart';
import 'package:active_edge_developer_exercise/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  final SharedPreferences preferences;
  final http.Client client;

  SettingScreen(
    this.preferences,
    this.client,
  );

  static const String routeName = '/settingScreen';

  @override
  State<StatefulWidget> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  bool themesValue = false;

  SettingOptions options;

  @override
  void initState() {
    super.initState();
    init();
//    _options = GalleryOptions(
//      theme: kLightGalleryTheme,
//      textScaleFactor: kAllGalleryTextScaleValues[0],
//      timeDilation: timeDilation,
//      platform: defaultTargetPlatform,
//    );
//    model = AppStateModel()..loadProducts();
  }

  init() async {
//    final provider = WorkwiseApp.of(context).options;
//
//    options = provider;

    AppSettings appSettings =
        await appSettingsBloc.fetchAppSettings(widget.preferences);

    themesValue = appSettings.themes;
  }

  void _handleOptionsChanged(SettingOptions newOptions) {
    setState(() {
//      if (options.timeDilation != newOptions.timeDilation) {
//        _timeDilationTimer?.cancel();
//        _timeDilationTimer = null;
//        if (newOptions.timeDilation > 1.0) {
//          // We delay the time dilation change long enough that the user can see
//          // that UI has started reacting and then we slam on the brakes so that
//          // they see that the time is in fact now dilated.
//          timeDilationTimer = Timer(const Duration(milliseconds: 150), () {
//            timeDilation = newOptions.timeDilation;
//          });
//        } else {
//          timeDilation = newOptions.timeDilation;
//        }
//      }

      setState(() {
        options = newOptions;
      });
      options = newOptions;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    MediaQueryData mediaQuery;
    mediaQuery = MediaQuery.of(context);

    var shortestSide = mediaQuery.size.shortestSide;
// Determine if we should use mobile layout or not. The
// number 600 here is a common breakpoint for a typical
// 7-inch tablet.
    final bool useMobileLayout = shortestSide < 600;

//    GalleryOptionsPage(
//      options: _options,
//      onOptionsChanged: _handleOptionsChanged,
//      onSendFeedback: widget.onSendFeedback ??
//              () {
//            launch('https://github.com/flutter/flutter/issues/new/choose',
//                forceSafariVC: false);
//          },
//    )

    SystemChrome.setSystemUIOverlayStyle(isDark
        ? SystemUiOverlayStyle.light.copyWith(
            statusBarColor: Colors.black45,
            systemNavigationBarColor: Colors.black45,
            systemNavigationBarIconBrightness: Brightness.light,
            systemNavigationBarDividerColor:
                Colors.black45 //or set color with: Color(0xFF0000FF)
            )
        : SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.white,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarDividerColor:
                Colors.white //or set color with: Color(0xFF0000FF)
            ));

    final provider = ActiveEdgeApp.of(context);

//    final provider = WorkwiseApp.of(context).options;

    options = provider.options;

    return DefaultTextStyle(
      style: theme.primaryTextTheme.subhead,
      child: Container(
        height: double.infinity,
        color: isDark ? black87Color : lightGrey,
        child: Column(
          children: <Widget>[
            HeaderItem(widget.preferences, widget.client),
            SizedBox(
              height: safeAreaHeight(context, 1),
            ),
            Expanded(
//              height: safeAreaHeight(context, 50),
              child: ListView(
                children: <Widget>[
                  OptionItem(widget.preferences, widget.client, options),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
