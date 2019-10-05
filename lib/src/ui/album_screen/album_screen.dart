import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

typedef CallbackAction(int index);

class AlbumScreen extends StatefulWidget {
  final SharedPreferences preferences;
  final http.Client client;

  AlbumScreen(
    this.preferences,
    this.client,
  );

  static const String routeName = '/albumScreen';

  @override
  State<StatefulWidget> createState() => AlbumScreenState();
}

class AlbumScreenState extends State<AlbumScreen> {
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
      color: isDark ? Colors.black87 : Colors.white70,
    );
  }
}
