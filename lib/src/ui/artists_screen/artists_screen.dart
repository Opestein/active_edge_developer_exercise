import 'package:active_edge_developer_exercise/src/ui/artists_screen/widgets/header.dart';
import 'package:active_edge_developer_exercise/src/utils/app_utilities.dart';
import 'package:active_edge_developer_exercise/src/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
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

    return Container(
      width: double.infinity,
      height: double.infinity,
      color: isDark ? Colors.black87 : Colors.white,
      child: Column(
        children: <Widget>[
          Header(widget.preferences, widget.client, "Artists"),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: safeAreaHeight(context, 50),
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.grey),
                            child: CachedNetworkImage(
                              imageUrl: "",
                              placeholder: (context, value) =>
                                  Image.asset(Assets.logo),
                            ),
                          ),
                          title: Text("Artiste Name",
                              style: theme.primaryTextTheme.title),
                          subtitle: Text("Album Name"),
                          trailing: Icon(Icons.more_vert),
                        );
                      }),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
