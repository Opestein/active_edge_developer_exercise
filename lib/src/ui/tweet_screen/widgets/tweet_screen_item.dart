import 'package:active_edge_developer_exercise/src/utils/colors.dart';
import 'package:flutter/material.dart';

typedef CallbackAction();

class TweetItem extends StatefulWidget {
//  final Datum datum;
  final CallbackAction callbackAction;
  TweetItem(this.callbackAction
//      this.datum
      );

  @override
  State<StatefulWidget> createState() => TweetItemState();
}

class TweetItemState extends State<TweetItem> {
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

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  "Software Engioneer",
                  style: theme.primaryTextTheme.headline.copyWith(
                      color: isDark ? primaryDarkColor : primaryColor),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isDark ? primaryDarkColor : primaryColor),
                  child: Text(
                    "Submitted",
                    style:
                        theme.primaryTextTheme.subhead.copyWith(color: white),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                  text: "Location:",
                  style: theme.primaryTextTheme.subtitle,
                  children: [
                    TextSpan(
                      text: " Surulere",
                      style: theme.primaryTextTheme.body1,
                    )
                  ]),
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                  text: "Budget:",
                  style: theme.primaryTextTheme.subtitle,
                  children: [
                    TextSpan(
                      text: " N40,000",
                      style: theme.primaryTextTheme.body1,
                    )
                  ]),
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                  text: "Preferred Gender:",
                  style: theme.primaryTextTheme.subtitle,
                  children: [
                    TextSpan(
                      text: " Male",
                      style: theme.primaryTextTheme.body1,
                    )
                  ]),
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                  text: "No of Workers:",
                  style: theme.primaryTextTheme.subtitle,
                  children: [
                    TextSpan(
                      text: " 400",
                      style: theme.primaryTextTheme.body1,
                    )
                  ]),
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                  text: "Frequency:",
                  style: theme.primaryTextTheme.subtitle,
                  children: [
                    TextSpan(
                      text: " Monthly",
                      style: theme.primaryTextTheme.body1,
                    )
                  ]),
            ),
            SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                  text: "Duration:",
                  style: theme.primaryTextTheme.subtitle,
                  children: [
                    TextSpan(
                      text: " 2",
                      style: theme.primaryTextTheme.body1,
                    )
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Morbi vestibulum volutpat enim. Praesent adipiscing. Vestibulum suscipit nulla quis orci. Phasellus nec sem in justo pellentesque facilisis. Vivamus consectetuer hendrerit lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac placerat dolor lectus quis orci. Phasellus dolor. Maecenas vestibulum mollis diam. Aenean vulputate eleifend tellus. Vestibulum ullamcorper mauris at ligula Morbi vestibulum volutpat enim. Praesent adipiscing. Vestibulum suscipit nulla quis orci. Phasellus nec sem in justo pellentesque facilisis. Vivamus consectetuer hendrerit lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Sed aliquam, nisi quis porttitor congue, elit erat euismod orci, ac placerat dolor lectus quis orci. Phasellus dolor. Maecenas vestibulum mollis diam. Aenean vulputate eleifend tellus. Vestibulum ullamcorper mauris at ligula",
              style: theme.primaryTextTheme.body1,
            ),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
