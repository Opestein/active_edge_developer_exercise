import 'package:active_edge_developer_exercise/src/data/server_provider/all_photos_provider/all_artists_photos_provider.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class _AllArtistsPhotosRepo {
  CancelableOperation _cancelableOperation;

  cancelOperation() async {
    if (_cancelableOperation != null) await _cancelableOperation.cancel();
  }

  Future fetchRepo(
      SharedPreferences preferences, http.Client client, id) async {
//    _cancelableOperation = CancelableOperation.fromFuture(
    return await allArtistsPhotosProvider.fetch(preferences, client, id
//        )
        );
  }
}

final allArtistsPhotosRepo = _AllArtistsPhotosRepo();
