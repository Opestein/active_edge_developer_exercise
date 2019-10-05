import 'package:active_edge_developer_exercise/src/app_config.dart';
import 'package:active_edge_developer_exercise/src/bloc/all_artists_bloc.dart';
import 'package:active_edge_developer_exercise/src/bloc/all_artists_photos_bloc.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

typedef CallbackAction(int index);

class ArtistsScreen extends StatefulWidget {
  final SharedPreferences preferences;
  final http.Client client;

  ArtistsScreen(
    this.preferences,
    this.client,
  );

  static const String routeName = '/artistsScreen';

  @override
  State<StatefulWidget> createState() => ArtistsScreenState();
}

class ArtistsScreenState extends State<ArtistsScreen> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    MediaQueryData mediaQuery;
    mediaQuery = MediaQuery.of(context);

    var shortestSide = mediaQuery.size.shortestSide;
// Determine if we should use mobile layout or not. The
// number 600 here is a common breakpoint for a typical
// 7-inch tablet.
    final bool useMobileLayout = shortestSide < 600;

    var artistBloc = AppConfig.of<AllArtistsBloc>(context);
    var artistPhotosBloc = AppConfig.of<AllArtistsPhotosBloc>(context);

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: isDark ? Colors.black87 : Colors.white,
      child: Column(
        children: <Widget>[
//          Header(widget.preferences, widget.client, "Artists"),
//          SizedBox(
//            height: 20,
//          ),
//          Padding(
//            padding: EdgeInsets.symmetric(horizontal: 18),
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                SizedBox(
//                  height: 10,
//                ),
//                StreamBuilder<AllArtists>(
//                    stream: artistBloc.behaviorSubject.stream,
//                    builder: (context, snapshot) {
//                      if (snapshot.hasData) {
//                        return SizedBox(
//                          height: safeAreaHeight(context, 75),
//                          child: ListView.builder(
//                              shrinkWrap: true,
//                              itemCount: 10,
//                              itemBuilder: (context, index) {
//                                return ListTile(
//                                  title: Text(snapshot.data.name,
//                                      style: theme.primaryTextTheme.title),
//                                  subtitle: Text(snapshot.data.phone),
//                                  trailing: Icon(Icons.more_vert),
//                                );
//                              }),
//                        );
//                      } else {
//                        return Container();
//                      }
//                    }),
////                Spacer(),
//              ],
//            ),
//          ),
        ],
      ),
    );
  }
}
