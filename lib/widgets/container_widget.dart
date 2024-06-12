import 'package:flutter/cupertino.dart';
import 'package:foodpanda/utilities/ui_utils.dart';

import 'package:foodpanda/constants/app_colors.dart' as app_colors;

class ContainerWidget extends StatelessWidget {
  final Color borderColor;
  final Color containerColor;
  final double borderWidth;
  final double borderRadius;
  final Widget child;
  final List<BoxShadow>? boxShadow;
  final double? height;
  final BoxBorder? border;
  consContainerWidget(
      {super.key,
      required this.child,
        this.border,
      this.borderColor = app_colors.borderColor,
      this.borderWidth = 0.5,
      this.containerColor = app_colors.containerColor,
      this.borderRadius = 10, this.boxShadow,  this.height});


  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
          color: containerColor,
          border: border ?? Border.all(color: borderColor, width: borderWidth),
          borderRadius:  BorderRadius.all(
              Radius.circular(UiUtils.getDeviceBasedRadius(borderRadius))),
          boxShadow: boxShadow ?? UiUtils.getBoxShadow()),
      child: child,
    );
  }
}
