import 'package:active_edge_developer_exercise/src/data/server_provider/delete_tweet_provider/delete_tweet_provider.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class _DeleteTweetRepo {
  CancelableOperation _cancelableOperation;

  cancelOperation() async {
    if (_cancelableOperation != null) await _cancelableOperation.cancel();
  }

  Future fetchRepo(
    SharedPreferences preferences,
    http.Client client,
  ) async {
//    _cancelableOperation = CancelableOperation.fromFuture(
    return await deleteTweetProvider.fetch(
      preferences, client,
//        )
    );
  }
}

final deleteTweetRepo = _DeleteTweetRepo();
