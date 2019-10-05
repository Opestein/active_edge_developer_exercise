import 'dart:convert';

import 'package:active_edge_developer_exercise/src/bloc/app_settings_bloc.dart';
import 'package:active_edge_developer_exercise/src/data/server_provider/base_url.dart';
import 'package:active_edge_developer_exercise/src/model/all_artiste.dart';
import 'package:active_edge_developer_exercise/src/model/app_settings.dart';
import 'package:active_edge_developer_exercise/src/utils/operation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class _DeleteTweetProvider {
  Future<Operation> fetch(
    SharedPreferences preferences,
    http.Client client,
  ) async {
    final url = baseUrlV1 + "job-board";

    print(url);
    print("over");

    AppSettings appSettings =
        await appSettingsBloc.fetchAppSettings(preferences);

    final response = await client.get(url, headers: {
      "Accept": "application/json",
    }).timeout(Duration(seconds: 120), onTimeout: () async {
      return http.Response(
          '{"error":"Connection Timed out. Please try again"}', 408);
    }).catchError((error) {
      return http.Response('{"error":"Error Connecting"}', 508);
    });

    print(response.body.toString());
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);

      var allArtists = AllArtists.fromJson(responseJson);

      return Operation(response.statusCode, allArtists);
    } else {
      final error = json.decode(response.body);

      print("error: " + error.toString());
      return Operation(response.statusCode, error);
    }
  }
}

final deleteTweetProvider = _DeleteTweetProvider();
