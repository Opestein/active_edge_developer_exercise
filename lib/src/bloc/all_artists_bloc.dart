import 'package:active_edge_developer_exercise/src/data/server_provider/all_artists_provider/all_artists_repo.dart';
import 'package:active_edge_developer_exercise/src/model/all_artiste.dart';
import 'package:active_edge_developer_exercise/src/utils/operation.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllArtistsBloc {
  CancelableOperation _cancelableOperation;
  BehaviorSubject<AllArtists> _behaviorSubject = BehaviorSubject<AllArtists>();

  BehaviorSubject<AllArtists> get behaviorSubject => _behaviorSubject;

  AllArtistsBloc(SharedPreferences preferences, http.Client client, per_page,
      order_by, sort) {
    fetchCurrent(preferences, client, per_page, order_by, sort);
//    _behaviorSubject = Observable.fromFuture(jobListingRepo.fetchRepo(
//        preferences, client, per_page, order_by, sort)).asBroadcastStream();
  }

  fetchCurrent(SharedPreferences preferences, http.Client client, per_page,
      order_by, sort) async {
    _cancelableOperation = CancelableOperation.fromFuture(allArtistsRepo
        .fetchRepo(
      preferences,
      client,
    )
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
