import 'package:active_edge_developer_exercise/src/ui/tweet_screen/widgets/tweet_screen_item.dart';
import 'package:active_edge_developer_exercise/src/utils/app_utilities.dart';
import 'package:active_edge_developer_exercise/src/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

typedef CallbackAction(int index);

class TweetScreen extends StatefulWidget {
  final SharedPreferences preferences;
  final http.Client client;

  TweetScreen(
    this.preferences,
    this.client,
  );

  static const String routeName = '/tweetScreen';

  @override
  State<StatefulWidget> createState() => TweetScreenState();
}

class TweetScreenState extends State<TweetScreen> {
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

    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu, color: Colors.transparent),
          centerTitle: true,
          elevation: 1,
          title: Text("Tweet", style: theme.primaryTextTheme.title),
        ),
        body: Container(
          width: double.infinity,
          height: safeAreaHeight(context, 75),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return TweetItem(handleCallback);
              }),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {});
          },
          icon: Icon(
            Icons.add,
            color: white,
          ),
          label: Text(
            "Create Tweet",
            style: theme.primaryTextTheme.body1.copyWith(color: white),
          ),
        ));
  }

  handleCallback() {}
}
