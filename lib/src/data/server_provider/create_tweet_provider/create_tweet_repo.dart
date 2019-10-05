import 'package:active_edge_developer_exercise/src/data/server_provider/create_tweet_provider/create_tweet_provider.dart';
import 'package:active_edge_developer_exercise/src/model/create_tweet_request.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class _CreateTweetRepo {
  CancelableOperation _cancelableOperation;

  cancelOperation() async {
    if (_cancelableOperation != null) await _cancelableOperation.cancel();
  }

  Future fetchRepo(SharedPreferences preferences, http.Client client,
      CreateTweetRequest createTweetRequest) async {
//    _cancelableOperation = CancelableOperation.fromFuture(
    return await createTweetProvider.fetch(
        preferences, client, createTweetRequest
//        )
        );
  }
}

final createTweetRepo = _CreateTweetRepo();
