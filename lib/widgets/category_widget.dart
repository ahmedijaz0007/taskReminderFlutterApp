


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/constants/enums.dart';
import 'package:foodpanda/widgets/container_widget.dart';
import 'package:foodpanda/widgets/label_widget.dart';
import 'package:foodpanda/widgets/menu_item_widget.dart';

import '../root/restaurant/models/menu_model.dart';

class CategoryWidget extends StatelessWidget{
  final String categoryName;
   final List<MenuItem>? items = [MenuItem(title: "Pizza",desc: "best in town",price: 0.0,imgPath: "bear.png"),MenuItem(title: "Pizza",desc: "best in town",price: 0.0,imgPath: "bear.png"),MenuItem(title: "Pizza",desc: "best in town",price: 0.0,imgPath: "bear.png")];

   CategoryWidget({super.key, required this.categoryName});
  @override
  Widget build(BuildContext context) {

   return Padding(
     padding: const EdgeInsets.only(bottom: 12.0),
     child: ContainerWidget(
       child: Padding(
         padding: const EdgeInsets.all(4.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             LabelWidget(data:categoryName,type: LabelType.title, ),
             const SizedBox(height: 5,),
             ...(items ?? []).map((element) => MenuItemWidget(title: element.title ?? "Pizza", desc: element.desc ?? "", price: element.price ?? 0.0, imgPath: element.imgPath ?? "",)
             ),
           ],
         ),
       ),
     ),
   );
  }

}