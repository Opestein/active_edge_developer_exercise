import 'package:active_edge_developer_exercise/src/data/server_provider/update_tweet_provider/all_artists_provider.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpdateTweetRepo {
  CancelableOperation _cancelableOperation;

  cancelOperation() async {
    if (_cancelableOperation != null) await _cancelableOperation.cancel();
  }

  Future fetchRepo(
    SharedPreferences preferences,
    http.Client client,
  ) async {
//    _cancelableOperation = CancelableOperation.fromFuture(
    return await updateTweetProvider.fetch(
      preferences, client,
//        )
    );
  }
}

final updateTweetRepo = UpdateTweetRepo();
