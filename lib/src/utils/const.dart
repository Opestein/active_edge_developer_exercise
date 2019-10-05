//import 'dart:math';
//
//import 'package:flutter/material.dart';
////import 'package:flutter_svg/flutter_svg.dart';
////var x=
////OrientationBuilder(
////builder: (context, orientation) {
////return orientation == Orientation.portrait
////? _buildVerticalLayout()
////    : _buildHorizontalLayout();
////},
////),
//
////SystemChrome.setPreferredOrientations(DeviceOrientation.portraitUp);
//
////width: 100.0 * MediaQuery.of(context).devicPixelRatio
//
////double responsiveWidth(context, double width) {
////  double actualWidth = width * MediaQuery.of(context).devicePixelRatio;
////
////  return actualWidth;
////}
//
//class SizeConfig {
//  static MediaQueryData _mediaQueryData;
//  static double screenWidth;
//  static double screenHeight;
//  static double blockSizeHorizontal;
//  static double blockSizeVertical;
//
//  static double _safeAreaHorizontal;
//  static double _safeAreaVertical;
//  static double safeBlockHorizontal;
//  static double safeBlockVertical;
//
//  void init(context) {
//    _mediaQueryData = MediaQuery.of(context);
//    screenWidth = _mediaQueryData.size.width;
//    screenHeight = _mediaQueryData.size.height;
//    blockSizeHorizontal = screenWidth / 100;
//    blockSizeVertical = screenHeight / 100;
//
//    _safeAreaHorizontal =
//        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
//    _safeAreaVertical =
//        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
//    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
//    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
//  }
//}
//
//double responsiveWidth(context, double width) {
//  MediaQueryData _mediaQueryData = MediaQuery.of(context);
//
//  double blockHorizontal = _mediaQueryData.size.width / 100;
//  double actualWidth = width * blockHorizontal;
//
//  return actualWidth;
//}
//
//double responsiveHeight(context, double height) {
//  MediaQueryData _mediaQueryData = MediaQuery.of(context);
//
//  double blockVertical = _mediaQueryData.size.height / 100;
//  double actualHeight = height * blockVertical;
//
//  return actualHeight;
//}
//
//double safeAreaWidth(context, double width) {
//  MediaQueryData _mediaQueryData = MediaQuery.of(context);
//
//  double safeAreaHorizontal =
//      _mediaQueryData.padding.left + _mediaQueryData.padding.right;
//
//  double safeAreaBlockHorizontal =
//      (_mediaQueryData.size.width - safeAreaHorizontal) / 100;
//  double actualWidth = width * safeAreaBlockHorizontal;
//
//  return actualWidth;
//}
//
//double safeAreaHeight(context, double height) {
//  MediaQueryData _mediaQueryData = MediaQuery.of(context);
//
//  double safeAreaVertical =
//      _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
//
//  double safeAreaBlockVertical =
//      (_mediaQueryData.size.height - safeAreaVertical) / 100;
//  double actualHeight = height * safeAreaBlockVertical;
//
//  return actualHeight;
//}
//
//double _singleUnit;
//double _scaleFactor;
//const noOfUnits = 480.0;
//
//_setSingleUnit(context) {
//  _singleUnit = MediaQuery.of(context).size.width;
//  _scaleFactor = MediaQuery.of(context).textScaleFactor;
//}
//
//double textFontSize(context, double size) {
//  double _scaleFactor = MediaQuery.of(context).textScaleFactor;
//  return (size) / _scaleFactor;
//}
//
////fontSize using textScaleFactor
//double singleTextUnit(BuildContext context, double size) {
//  if (_scaleFactor == null) _setSingleUnit(context);
//  return (size) / _scaleFactor;
//}
//
//String randomString(int stringLength) {
//  const chars = "abcdefghijklmnopqrstuvwxyz0123456789";
//
//  Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
//  String result = "";
//  for (var i = 0; i < stringLength; i++) {
//    result += chars[rnd.nextInt(chars.length)];
//  }
//  return result;
//}
