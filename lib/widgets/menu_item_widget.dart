
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/constants/enums.dart';
import 'package:foodpanda/utilities/ui_utils.dart';
import 'package:foodpanda/widgets/label_widget.dart';

class MenuItemWidget extends StatelessWidget{
  final String title;
  final String desc;
  final double price;
  final String imgPath;

  const MenuItemWidget({super.key, required this.title, required this.desc, required this.price, this.imgPath = "bear.png"});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LabelWidget(data: title,type: LabelType.bodyLarge, fontWeight: FontWeight.w700, ),
                  const SizedBox(height: 2,),
                  LabelWidget(data: desc ),
                  const SizedBox(height: 2,),
                  LabelWidget(data: "Rs$price.00"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:5.0),
              child: Image.asset(UiUtils.getImagePath(imgPath, isCommon: true),width: 80,height: 80,),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.all(4.0),
          child: Divider(),
        ),
      ],
    );
  }


}
