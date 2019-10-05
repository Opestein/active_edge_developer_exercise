import 'package:active_edge_developer_exercise/src/utils/app_utilities.dart';
import 'package:active_edge_developer_exercise/src/utils/assets.dart';
import 'package:active_edge_developer_exercise/src/utils/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AlbumCardItem extends StatefulWidget {
  AlbumCardItem();

  @override
  State<StatefulWidget> createState() => AlbumCardItemState();
}

class AlbumCardItemState extends State<AlbumCardItem> {
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
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: EdgeInsets.only(
          left: safeAreaHeight(context, 4),
          top: safeAreaHeight(context, 2.5),
          right: safeAreaHeight(context, 1.5),
          bottom: safeAreaHeight(context, 1.5),
        ),
        decoration: BoxDecoration(
            color: isDark ? primaryDarkColor : primaryColor,
            borderRadius: BorderRadius.circular(20)),
        height: safeAreaHeight(context, 34),
        width: safeAreaHeight(context, 34),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Container(
                child: CachedNetworkImage(
                  imageUrl: "",
                  placeholder: (context, value) => Image.asset(Assets.logo),
                ),
              ),
            ),
            SizedBox(
              height: safeAreaHeight(context, 2),
            ),
            Expanded(
              flex: 1,
              child: Text(
//                widget.datum.description ??
                "Album Name",
                maxLines: 2,
                style: isDark
                    ? theme.primaryTextTheme.title
                    : theme.primaryTextTheme.title.copyWith(color: white),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
//                widget.datum.description ??
                "Artiste Name",
                maxLines: 2,
                style: isDark
                    ? theme.primaryTextTheme.subhead
                    : theme.primaryTextTheme.subhead.copyWith(color: white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
