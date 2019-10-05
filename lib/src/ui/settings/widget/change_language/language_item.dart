import 'package:active_edge_developer_exercise/src/app.dart';
import 'package:active_edge_developer_exercise/src/app_translations.dart';
import 'package:active_edge_developer_exercise/src/application.dart';
import 'package:active_edge_developer_exercise/src/ui/general_widgets/option_items.dart';
import 'package:active_edge_developer_exercise/src/ui/settings/widget/change_language/languages.dart';
import 'package:active_edge_developer_exercise/src/ui/settings/widget/option/options.dart';
import 'package:active_edge_developer_exercise/src/utils/colors.dart';
import 'package:flutter/material.dart';

class LanguageItem extends StatefulWidget {
  const LanguageItem(
    this.options,
  );

  final SettingOptions options;

  @override
  _LanguageItemState createState() => _LanguageItemState();
}

class _LanguageItemState extends State<LanguageItem> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final bool isDark = theme.brightness == Brightness.dark;

    final provider = ActiveEdgeApp.of(context);

    return OptionsItem(
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Column(
//              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Language', style: theme.primaryTextTheme.subhead),
                Text(
                  '${application.supportedLocales().elementAt(index).toLanguageTag().substring(3)}',
                  style: theme.primaryTextTheme.body1,

//                  Theme.of(context).primaryTextTheme.body1,
                ),
              ],
            ),
          ),
//          Spacer(),
          PopupMenuButton<ActiveEdgeLanguages>(
            padding: const EdgeInsetsDirectional.only(end: 16.0),
            color: isDark ? primaryDarkColor : Colors.white,
            icon: const Icon(Icons.arrow_drop_down),
            itemBuilder: (BuildContext context) {
              return kAllActiveEdgeLanguageValues
                  .map<PopupMenuItem<ActiveEdgeLanguages>>(
                      (ActiveEdgeLanguages languages) {
                return PopupMenuItem<ActiveEdgeLanguages>(
                  value: languages,
                  child: Text(
                    languages.label,
                  ),
                );
              }).toList();
            },
            onSelected: (ActiveEdgeLanguages languages) {
              setState(() {
                index = languages.index;
                provider.handleOptionsChanged(
                  widget.options.copyWith(
                      appTranslationsDelegate: AppTranslationsDelegate(
                          newLocale: application
                              .supportedLocales()
                              .elementAt(languages.index))),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
