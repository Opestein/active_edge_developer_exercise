import 'package:active_edge_developer_exercise/src/data/server_provider/all_photos_provider/all_artists_photos_repo.dart';
import 'package:active_edge_developer_exercise/src/model/album_photos.dart';
import 'package:active_edge_developer_exercise/src/utils/operation.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllArtistsPhotosBloc {
  CancelableOperation _cancelableOperation;
  BehaviorSubject<AlbumPhotos> _behaviorSubject =
      BehaviorSubject<AlbumPhotos>();

  BehaviorSubject<AlbumPhotos> get behaviorSubject => _behaviorSubject;

  AllArtistsPhotosBloc(SharedPreferences preferences, http.Client client, id) {
    fetchCurrent(preferences, client, id);
//    _behaviorSubject = Observable.fromFuture(jobListingRepo.fetchRepo(
//        preferences, client, per_page, order_by, sort)).asBroadcastStream();
  }

  fetchCurrent(SharedPreferences preferences, http.Client client, id) async {
    _cancelableOperation = CancelableOperation.fromFuture(allArtistsPhotosRepo
        .fetchRepo(preferences, client, id)
        .then((response) {
      Operation operation = response;
      if (operation.code == 200) {
        _behaviorSubject.add(operation.result);
      } else {
        _behaviorSubject.addError(operation.result);
      }
    }));
  }

  cancelOperation() async {
    if (_cancelableOperation != null) await _cancelableOperation.cancel();
  }

  dispose() {
    _behaviorSubject.close();
  }
}
