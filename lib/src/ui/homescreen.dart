import 'package:active_edge_developer_exercise/src/ui/album_screen/album_screen.dart';
import 'package:active_edge_developer_exercise/src/ui/artists_screen/artists_screen.dart';
import 'package:active_edge_developer_exercise/src/ui/tweet_screen/tweet_screen.dart';
import 'package:active_edge_developer_exercise/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final SharedPreferences preferences;
  final http.Client client;

  HomeScreen(
    this.preferences,
    this.client,
  );

  static const String routeName = '/homeScreen';

  @override
  State<StatefulWidget> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  int _selectedDrawerIndex = 0;

//  TapGestureRecognizer _tapPressRecognizer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _getBottomItemWidget(int pos) {
    switch (pos) {
      case 0:
        return ArtistsScreen(widget.preferences, widget.client);
      case 1:
        return AlbumScreen(
          widget.preferences,
          widget.client,
        );
      case 2:
        return TweetScreen(
          widget.preferences,
          widget.client,);

      default:
        return ArtistsScreen(
          widget.preferences,
          widget.client,
        );
    }
  }

  onSelectItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });
//    setState(() {});
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

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: lightGrey,
        key: globalKey,
        body: Column(
          children: <Widget>[
            Expanded(
              child: _getBottomItemWidget(_selectedDrawerIndex),
            ),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: isDark ? black87Color : white,
          ),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: isDark ? primaryDarkColorTrans : primaryColor,
              backgroundColor: isDark ? black87Color : white,
              unselectedItemColor:
                  isDark ? primaryDarkColor : primaryColorTrans,
              unselectedLabelStyle: TextStyle(
                color: isDark ? primaryDarkColor : primaryColorTrans,
              ),
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: _selectedDrawerIndex,
              onTap: (index) => onSelectItem(index),
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                    child: Icon(Icons.person_outline),
                  ),
                  title: Text(
                    "Artiste",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 2.0, left: 4.0),
                    child: Icon(Icons.album),
                  ),
                  title: Text(
                    "Albums",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.comment,
                  ),
                  title: Text(
                    "Tweet",
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
