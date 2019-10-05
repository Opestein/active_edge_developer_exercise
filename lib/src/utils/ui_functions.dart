import 'dart:math' as math;

import 'package:active_edge_developer_exercise/src/ui/general_widgets/dialog/dialog_screen.dart';
import 'package:active_edge_developer_exercise/src/utils/app_utilities.dart';
import 'package:active_edge_developer_exercise/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef OnPop();

void showDialogSingleButton(
    BuildContext context, String title, String message, String buttonLabel,
    {OnPop onPop, OnPop cancelNetWorkCall}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return DialogScreen(
        title,
        message,
        buttonLabel,
        onPop: onPop,
      );
//      return AlertDialog(
//        title: new Text(title),
//        content: new Text(message),
//        actions: <Widget>[
//          new FlatButton(
//            child: new Text(
//              buttonLabel,
//              style: TextStyle(color: themeColor),
//            ),
//            onPressed: () {
//              Navigator.of(context).pop();
//            },
//          ),
//        ],
//      );
    },
  );
}

void showSnackBar(BuildContext context, GlobalKey<ScaffoldState> globalKey,
    String message, String buttonLabel,
    {OnPop onPop}) {
  globalKey.currentState.showSnackBar(SnackBar(
    content: Text(
      message,
      style:
          TextStyle(fontSize: textFontSize(context, 15), color: Colors.white),
    ),
    duration: Duration(seconds: 3),
  ));
}

//class _FlatButton extends StatelessWidget {
//  const _FlatButton({Key key, this.onPressed, this.child}) : super(key: key);
//
//  final VoidCallback onPressed;
//  final Widget child;
//
//  @override
//  Widget build(BuildContext context) {
//    return FlatButton(
//      padding: EdgeInsets.zero,
//      onPressed: onPressed,
//      child: DefaultTextStyle(
//        style: Theme.of(context).primaryTextTheme.subhead,
//        child: child,
//      ),
//    );
//  }
//}

//for this, th background view will not be blurred
void showSlideUpView(BuildContext context) {
  showBottomSheet(
      context: context,
      builder: (context) {
        return new Container(
          child: new GestureDetector(
            onTap: () => Navigator.pop(context),
            child: new Text("Click me to close this non-modal bottom sheet"),
          ),
        );
      });
}

//for this, th background view will be blurred
modalBottomSheetSuccessFul(BuildContext context, String message, bool status) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
            padding: EdgeInsets.only(
                left: 16.0, right: 16.0, top: 50.0, bottom: 60.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  message,
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500),
                )
              ],
            ));
      });
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
