import 'dart:async';

import 'package:active_edge_developer_exercise/src/app_config.dart';
import 'package:active_edge_developer_exercise/src/app_translations.dart';
import 'package:active_edge_developer_exercise/src/application.dart';
import 'package:active_edge_developer_exercise/src/ui/settings/widget/option/options.dart';
import 'package:active_edge_developer_exercise/src/ui/settings/widget/text_font/scales.dart';
import 'package:active_edge_developer_exercise/src/ui/settings/widget/theme/themes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

String replacementUrlA;

class ActiveEdgeApp<B> extends StatefulWidget {
  final void Function(BuildContext context, B bloc) onDispose;
  final B Function(BuildContext context, B bloc) builder;
  final Widget child;
  final String url;

  static ActiveEdgeAppState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(AppConfig) as AppConfig)
        .activeEdgeAppState;
  }

  ActiveEdgeApp({
    Key key,
    @required this.child,
    this.builder,
    this.onDispose,
    this.url,
  }) : super(key: key);
  createState() => ActiveEdgeAppState<B>();
}

class ActiveEdgeAppState<B> extends State<ActiveEdgeApp<B>> {
  SettingOptions options;
  Timer timeDilationTimer;
  B bloc;

  @override
  void initState() {
    super.initState();
    if (widget.builder != null) {
      bloc = widget.builder(context, bloc);
    }
    options = SettingOptions(
      appTranslationsDelegate: AppTranslationsDelegate(
          newLocale: application.supportedLocales().first),
      notification: false,
      theme: kLightGalleryTheme,
      textScaleFactor: kAllGalleryTextScaleValues[0],
      timeDilation: timeDilation,
      platform: defaultTargetPlatform,
    );
  }

  @override
  void dispose() {
    if (widget.onDispose != null) {
      widget.onDispose(context, bloc);
    }
    timeDilationTimer?.cancel();
    timeDilationTimer = null;
    super.dispose();
  }

  handleOptionsChanged(SettingOptions newOptions) {
    if (options.timeDilation != newOptions.timeDilation) {
      timeDilationTimer?.cancel();
      timeDilationTimer = null;
      if (newOptions.timeDilation > 1.0) {
        // We delay the time dilation change long enough that the user can see
        // that UI has started reacting and then we slam on the brakes so that
        // they see that the time is in fact now dilated.
        timeDilationTimer = Timer(const Duration(milliseconds: 150), () {
          timeDilation = newOptions.timeDilation;
        });
      } else {
        timeDilation = newOptions.timeDilation;
      }
    }
    setState(() {
      options = newOptions;
    });
  }

  Widget applyTextScaleFactor(Widget child) {
    return Builder(
      builder: (BuildContext context) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: options.textScaleFactor.scale,
          ),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    var config = AppConfig.of(context);
    replacementUrlA = widget.url;
//    replacementUrlB = config.replacementUrlB;

    return AppConfig(
      bloc: bloc,
      activeEdgeAppState: this,
      child: widget.child,
    );
  }
}
