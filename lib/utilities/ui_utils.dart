import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodpanda/cache/cache_manager.dart';

import '../../constants/app_colors.dart';
import '../constants/icon_constants.dart';

abstract class UiUtils {
  // static double getWidth(BuildContext context) {
  //   return MediaQuery.of(context).size.width;
  // }
  //
  // static double getHeight(BuildContext context) {
  //   return MediaQuery.of(context).size.height;
  // }

  static double getDeviceBasedWidth(double width) {
    var deviceWidth = CacheManager().screenWidth;
    return (width / 375) * deviceWidth;
  }

  static double   getDeviceBasedHeight(double height) {
    var deviceHeight = CacheManager().screenHeight;
    return (height / 812) * deviceHeight;
  }

  static EdgeInsets getDeviceBasedPadding(
      double left, double top, double right, double bottom) {
    return EdgeInsets.fromLTRB(
        UiUtils.getDeviceBasedWidth(left),
        UiUtils.getDeviceBasedHeight(top),
        UiUtils.getDeviceBasedWidth(right),
        UiUtils.getDeviceBasedHeight(bottom));
  }

  static Widget getIcon(String imgName) {
    try {
      if (imgName.contains(IconsConstants.svgExt)) {
        return SvgPicture.asset(
          getImagePath(imgName),
          fit: BoxFit.scaleDown,
        );
      } else if (imgName.contains(IconsConstants.pngExt)) {
        return Image.asset(
          getImagePath(imgName),
          fit: BoxFit.scaleDown,
        );
      }
    } catch (_) {
      return SvgPicture.asset(
          IconsConstants.svgFolderPath + IconsConstants.icPlaceHolder);
    }
    return SvgPicture.asset(
        IconsConstants.svgFolderPath + IconsConstants.icPlaceHolder);
  }

  static String getImagePath(String imageName, {bool isCommon = false}) {
    String? path;
    try {

      if (isCommon){
        path = IconsConstants.commonPath;
      }
      else if(CacheManager().themeMode  == ThemeMode.light){
        path = IconsConstants.lightPath;
      }
      else{
        path = IconsConstants.darkPath;
      }

      if (imageName.contains(IconsConstants.pngExt)) {
        return path + IconsConstants.pngFolderPath + imageName;
      } else {
        return path + IconsConstants.svgFolderPath + imageName;
      }
    } catch (_) {
      return (path ?? IconsConstants.commonPath) + IconsConstants.pngFolderPath + imageName;
    }
  }

  static makeBorderRadius(
      {double all = 0,
      double topLeft = 0,
      double topRight = 0,
      double bottomLeft = 0,
      double bottomRight = 0}) {
    if (all != 0) {
      topLeft = all;
      topRight = all;
      bottomLeft = all;
      bottomRight = all;
    }

    return BorderRadius.only(
        topLeft: Radius.circular(getDeviceBasedRadius(topLeft)),
        topRight: Radius.circular(getDeviceBasedRadius(topRight)),
        bottomLeft: Radius.circular(getDeviceBasedRadius(bottomLeft)),
        bottomRight: Radius.circular(getDeviceBasedRadius(bottomRight)));
  }

  static makeBorder(
      {Color color = Colors.grey,
      double width = 0,
      BorderStyle borderStyle = BorderStyle.solid}) {
    return Border.all(
        color: color,
        width: UiUtils.getDeviceBasedWidth(width),
        style: borderStyle);
  }

  static getDeviceBasedRadius(double value) {
    var deviceWidth = CacheManager().screenWidth;
    var percentage = ((value / 375.0)); //zeplin default width
    return (deviceWidth * percentage);
  }

  static double getDeviceBasedFont(double value) {
    /*   var scaleWidth = Get.width / 375;
    var scaleHeight = Get.height / 812;

    var scaleText = min(scaleWidth, scaleHeight);
    return value * scaleText;*/
    return value;
  }

  static  getBoxShadow(
      {Color color = boxShadowColor,
      double blurRadius = 7,
      double spreadRadius = 2,
      double offset = 5,
      double opacity = 0.5}) {
    return [
      BoxShadow(
        color: color.withOpacity(opacity),
        spreadRadius: getDeviceBasedRadius(spreadRadius),
        blurRadius: getDeviceBasedRadius(blurRadius),
        offset: Offset(0, offset), // changes position of shadow
      ),
    ];
  }
}
