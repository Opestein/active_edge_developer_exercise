import 'package:active_edge_developer_exercise/src/app.dart';
import 'package:active_edge_developer_exercise/src/ui/general_widgets/option_items.dart';
import 'package:active_edge_developer_exercise/src/ui/settings/widget/option/options.dart';
import 'package:active_edge_developer_exercise/src/ui/settings/widget/text_font/scales.dart';
import 'package:active_edge_developer_exercise/src/utils/colors.dart';
import 'package:flutter/material.dart';

class TextScaleFactorItem extends StatefulWidget {
  const TextScaleFactorItem(
    this.options,
  );

  final SettingOptions options;

  @override
  _TextScaleFactorItemState createState() => _TextScaleFactorItemState();
}

class _TextScaleFactorItemState extends State<TextScaleFactorItem> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final bool isDark = theme.brightness == Brightness.dark;

    final provider = ActiveEdgeApp.of(context);

    return OptionsItem(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Text size',
                  style: theme.primaryTextTheme.subhead,
                ),
                Text(
                  '${widget.options.textScaleFactor.label}',
                  style: theme.primaryTextTheme.body1,
//                  Theme.of(context).primaryTextTheme.body1,
                ),
              ],
            ),
          ),
          PopupMenuButton<TimbalaTextScaleValue>(
            padding: const EdgeInsetsDirectional.only(end: 16.0),
            icon: const Icon(Icons.arrow_drop_down),
            color: isDark ? primaryDarkColor : Colors.white,
            itemBuilder: (BuildContext context) {
              return kAllGalleryTextScaleValues
                  .map<PopupMenuItem<TimbalaTextScaleValue>>(
                      (TimbalaTextScaleValue scaleValue) {
                return PopupMenuItem<TimbalaTextScaleValue>(
                  value: scaleValue,
                  child: Text(
                    scaleValue.label,
                  ),
                );
              }).toList();
            },
            onSelected: (TimbalaTextScaleValue scaleValue) {
              setState(() {
                provider.handleOptionsChanged(
                  widget.options.copyWith(textScaleFactor: scaleValue),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
