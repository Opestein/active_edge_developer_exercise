import 'package:active_edge_developer_exercise/src/app.dart';
import 'package:flutter/material.dart';

Type _getType<B>() => B;

class AppConfig<B> extends InheritedWidget {
  final B bloc;
  final String replacementUrlA;
  final String replacementUrlB;
  final ActiveEdgeAppState activeEdgeAppState;

  const AppConfig({
    Key key,
    this.bloc,
    this.replacementUrlA,
    this.replacementUrlB,
    this.activeEdgeAppState,
    Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(AppConfig<B> oldWidget) {
    return true;
//    return oldWidget.bloc != bloc;
  }

  static B of<B>(BuildContext context) {
    final type = _getType<AppConfig<B>>();
    final AppConfig<B> provider = context.inheritFromWidgetOfExactType(type);

    return provider.bloc;
  }
}

//class AppConfig extends InheritedWidget {
//  final String replacementUrlA;
//  final String replacementUrlB;
//  final TimbalaAppState workwiseAppState;
//
//  AppConfig({
//    this.replacementUrlA,
//    this.replacementUrlB,
//    this.workwiseAppState,
//    Widget child,
//  }) : super(child: child);
//
//  static AppConfig of(BuildContext context) =>
//      context.inheritFromWidgetOfExactType(AppConfig);
//
//  @override
//  bool updateShouldNotify(InheritedWidget oldWidget) => true;
//}
