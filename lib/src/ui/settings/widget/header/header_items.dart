import 'package:active_edge_developer_exercise/src/app.dart';
import 'package:active_edge_developer_exercise/src/utils/app_utilities.dart';
import 'package:active_edge_developer_exercise/src/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HeaderItem extends StatefulWidget {
  final SharedPreferences preferences;
  final http.Client client;

  HeaderItem(
    this.preferences,
    this.client,
  );

  @override
  _HeaderItemState createState() => _HeaderItemState();
}

class _HeaderItemState extends State<HeaderItem> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final bool isDark = theme.brightness == Brightness.dark;

    final provider = TimbalaApp.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      color: isDark ? Colors.black45 : Colors.white,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: safeAreaHeight(context, 2),
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child:
//                              Row(
//                                children: <Widget>[
//                            Icon(
//                              Icons.arrow_back_ios,
//                              size: 18,
//                            ),
                      Text(
                    "Profile",
                    maxLines: 1,
                    style: theme.primaryTextTheme.display1,
                  ),
//                                ],
//                              ),
                ),
              ),
//              Spacer(),
//                            Container(
//                              height: safeAreaHeight(context, 7),
//                            )
            ],
          ),
          SizedBox(
            height: safeAreaHeight(context, 2),
          ),
          Container(
            width: safeAreaHeight(context, 80),
            child: Row(
              children: <Widget>[
                Container(
                  width: safeAreaHeight(context, 12),
                  height: safeAreaHeight(context, 12),
                  padding: EdgeInsets.all(safeAreaHeight(context, 1)),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: isDark ? Colors.white : Colors.black,
                      )),
                  child: CachedNetworkImage(
                    imageUrl: "",
                    placeholder: (context, value) => Image.asset(Assets.logo),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: safeAreaWidth(context, 60),
                      child: Text(
                        "Brian Daniel",
                        softWrap: true,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.primaryTextTheme.display2,
                      ),
                    ),
                    Text(
                      "something@sone.com",
                      style: theme.primaryTextTheme.body1,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Phone: 08026857574",
                      style: theme.primaryTextTheme.body1,
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "BVN: 0224543756",
                      style: theme.primaryTextTheme.body1,
                    ),
//                              RichText(
//                                  overflow: TextOverflow.ellipsis,
//                                  text: TextSpan(
//                                      text: "Brian Daniegfls\n",
//                                      style: TextStyle(
//                                          fontSize: textFontSize(context, 32),
//                                          fontWeight: FontWeight.w700,
//                                          color: black),
//                                      children: [
//                                        TextSpan(
//                                          text: "something@sone.com",
//                                          style: TextStyle(
//                                              fontSize:
//                                                  textFontSize(context, 13),
//                                              fontWeight: FontWeight.w700,
//                                              color: black38),
//                                        )
//                                      ])),
                    SizedBox(
                      height: safeAreaHeight(context, 2),
                    ),
//                            InkWell(
//                                onTap: () => Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) => EditProfileScreen(
//                                              widget.preferences,
//                                              widget.client,
//                                            ))),
//                                child: Container(
//                                  padding: EdgeInsets.all(10),
//                                  decoration: BoxDecoration(
//                                      border: Border.all(
//                                    color:
//                                        isDark ? Colors.white : Colors.black38,
//                                  )),
//                                  child: Text(
//                                    ""
//                                    "Edit Profile",
//                                    style: theme.primaryTextTheme.body1,
//                                  ),
//                                ))
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: safeAreaHeight(context, 5),
          ),
        ],
      ),
    );
  }
}
