import 'package:active_edge_developer_exercise/src/data/server_provider/create_tweet_provider/create_tweet_repo.dart';
import 'package:active_edge_developer_exercise/src/model/create_tweet_request.dart';
import 'package:active_edge_developer_exercise/src/ui/general_widgets/dialog/loading_dialog.dart';
import 'package:active_edge_developer_exercise/src/utils/operation.dart';
import 'package:active_edge_developer_exercise/src/utils/ui_functions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

typedef CallbackAction();

class CreateJobHelper {
  BuildContext _authContext;
  http.Client _client;
  SharedPreferences _preferences;
  CallbackAction _callbackAction;

  doOperation(
      SharedPreferences preferences,
      http.Client client,
      BuildContext context,
      CreateTweetRequest createTweetRequest,
      CallbackAction callbackAction) async {
    this._preferences = preferences;
    this._client = client;
    this._authContext = context;
    this._callbackAction = callbackAction;

    showDialog(
      context: _authContext,
      builder: (_) => LoadingDialog(
        "Creating Tweet...",
      ),
      barrierDismissible: false,
    );

    createTweetRepo
        .fetchRepo(_preferences, _client, createTweetRequest)
        .then((operation) {
      _completeProcess(operation);
    });
  }

  _completeProcess(
    Operation operation,
  ) async {
    Navigator.pop(_authContext);
    if (operation.code == 200) {
//      CreateJobResponse createJobResponse = operation.result;
//      showDialogSingleButton(
//          _authContext, "message", createJobResponse.message, "Ok",
//          onPop: _callbackAction);
//      print("operation: " + operation.result.toString());
    } else {
      String error = operation.result['error']
          .toString()
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll('"', "")
          .replaceAll(",", "");

      showDialogSingleButton(_authContext, "message", error, "Ok",
          onPop: _callbackAction);
    }
  }
}
