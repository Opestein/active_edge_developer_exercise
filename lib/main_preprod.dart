import 'package:active_edge_developer_exercise/src/app.dart';
import 'package:active_edge_developer_exercise/src/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  var preferences = await SharedPreferences.getInstance();
  var client = http.Client();

  var configuredApp = ActiveEdgeApp(
      child: ActiveEdgeHome(
        preferences,
        client,
      ),
      url: "https://jsonplaceholder.typicode.com/");

  runApp(configuredApp);
}
