import 'package:active_edge_developer_exercise/src/app_translations.dart';
import 'package:active_edge_developer_exercise/src/utils/app_utilities.dart';
import 'package:active_edge_developer_exercise/src/utils/colors.dart';
import 'package:active_edge_developer_exercise/src/utils/ui_functions.dart';
import 'package:flutter/material.dart';


class DialogScreen extends StatefulWidget {
  final String title;
  final String message;
  final String buttonLabel;
  OnPop onPop;

  DialogScreen(
    this.title,
    this.message,
    this.buttonLabel, {
    this.onPop,
  });
  createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  var previousText = <String>[];
  var nextText = <String>[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<bool> willPop() async {
    if (widget.onPop != null) {
      Navigator.pop(context);
    }

    return Future.value(true);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    previousText = AppTranslations.of(context).textArray('app_tour_precious');
    nextText = AppTranslations.of(context).textArray('app_tour_next');
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery;
    mediaQuery = MediaQuery.of(context);

    var shortestSide = mediaQuery.size.shortestSide;
// Determine if we should use mobile layout or not. The
// number 600 here is a common breakpoint for a typical
// 7-inch tablet.
    final bool useMobileLayout = shortestSide < 600;

    //appTourBloc.initCheck(context);
    // TODO: implement build
    return WillPopScope(
      child: Dialog(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          padding: EdgeInsets.all(safeAreaWidth(context, 2)),
          width: useMobileLayout
              ? mediaQuery.size.width * 0.5
              : mediaQuery.size.width * 0.3,
          height: useMobileLayout
              ? mediaQuery.size.width * 0.5
              : mediaQuery.size.width * 0.3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.title,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: textFontSize(context, 14))),
              Divider(
                color: Colors.grey,
              ),
              Spacer(
                flex: 1,
              ),
              Text(
                widget.message ?? "",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: textFontSize(context, 22)),
              ),
              Spacer(
                flex: 2,
              ),
              FlatButton(
                color: primaryColor,
                child: new Text(
                  widget.buttonLabel,
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  if (widget.onPop != null) {
                    widget.onPop();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      onWillPop: willPop,
    );
  }
}
