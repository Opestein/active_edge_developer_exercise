import 'package:active_edge_developer_exercise/src/ui/album_screen/widgets/album_card_item.dart';
import 'package:active_edge_developer_exercise/src/utils/app_utilities.dart';
import 'package:flutter/material.dart';

class AlbumCard extends StatefulWidget {
  AlbumCard();

  @override
  State<StatefulWidget> createState() => AlbumCardState();
}

class AlbumCardState extends State<AlbumCard> {
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
//    var albumCardBloc = AppConfig.of<AlbumCardBloc>(context);

    return SizedBox(
      height: safeAreaHeight(context, 34),
      child: AlbumCardItem(),
//      child: StreamBuilder<AlbumCard>(
//          stream: albumBloc.behaviorSubject.stream,
//          builder: (context, snapshot) {
//            if (snapshot.hasData) {
//              var data = snapshot.data.data.data;
//              if (data.length > 0) {
//                return ListView.builder(
//                    scrollDirection: Axis.horizontal,
//                    padding: EdgeInsets.symmetric(horizontal: 14),
//                    itemCount: data.length,
//                    itemBuilder: (context, index) {
//                      return AlbumCardItem(data.elementAt(index));
//                    });
//              } else {
//                return Center(
//                  child: Text("No Album"),
//                );
//              }
//            } else if (snapshot.connectionState == ConnectionState.waiting) {
//              return Center(
//                child: CircularProgressIndicator(
//                    valueColor: AlwaysStoppedAnimation<Color>(
//                        isDark ? primaryDarkColor : primaryColor)),
//              );
//            } else {
//              return Center(
//                child: Text("No Album"),
//              );
//            }
//          }),
    );
  }
}
