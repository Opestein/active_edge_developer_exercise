import 'package:active_edge_developer_exercise/src/app.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Header extends StatefulWidget {
  final SharedPreferences preferences;
  final http.Client client;
  final String title;

  Header(
    this.preferences,
    this.client,
    this.title,
  );

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final bool isDark = theme.brightness == Brightness.dark;

    final provider = ActiveEdgeApp.of(context);

    return AppBar(
      leading: Icon(Icons.menu, color: Colors.transparent),
      centerTitle: true,
      elevation: 1,
      title: Text(widget.title, style: theme.primaryTextTheme.title),
    );
  }
}
