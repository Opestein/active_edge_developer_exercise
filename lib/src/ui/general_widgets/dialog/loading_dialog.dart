import 'package:active_edge_developer_exercise/src/utils/app_utilities.dart';
import 'package:active_edge_developer_exercise/src/utils/assets.dart';
import 'package:active_edge_developer_exercise/src/utils/image_rotation_widget.dart';
import 'package:flutter/material.dart';

//String pleaseWaitText;
class LoadingDialog extends StatelessWidget {
  final String text;
  LoadingDialog(
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Dialog(
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: _buildDialogChild(context),
    );
  }

  Widget _buildDialogChild(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(24.0),
      height: 100,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ImageRotateWidget(
            Assets.logo,
            64.0,
            64.0,
          ),
          SizedBox(
            height: 24.0,
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: singleTextUnit(context, 18.0),
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
