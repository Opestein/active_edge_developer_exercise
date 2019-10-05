import 'package:active_edge_developer_exercise/src/ui/general_widgets/option_items.dart';
import 'package:active_edge_developer_exercise/src/utils/colors.dart';
import 'package:flutter/material.dart';

class BooleanItem extends StatelessWidget {
  const BooleanItem(this.title, this.value, this.onChanged, {this.switchKey});

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;
  // [switchKey] is used for accessing the switch from driver tests.
  final Key switchKey;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;
    final double textScaleFactor = MediaQuery.textScaleFactorOf(context);

    return OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(
              child: Text(title, style: theme.primaryTextTheme.body1
//            theme.textTheme.subhead.copyWith(
//              color: isDark ? Colors.white : const Color(0xFF202124),
//            ),
                  )),
          Switch(
            key: switchKey,
            value: value,
            onChanged: onChanged,
            activeColor: isDark ? secondaryDarkColor : secondaryColor,
            activeTrackColor: isDark ? Colors.white30 : Colors.black26,
          ),
        ],
      ),
    );
  }
}
