import 'package:flutter/material.dart';
import 'package:foodpanda/constants/enums.dart';
import 'package:foodpanda/constants/icon_constants.dart';
import 'package:foodpanda/utilities/ui_utils.dart';
import 'package:foodpanda/widgets/label_widget.dart';

import '../root/restaurant/models/restaurant_model.dart';

class RestaurantInfoWidget extends StatelessWidget{
  const RestaurantInfoWidget({super.key, required this.basicInfo});
 final RestaurantBasicInfo basicInfo;

  @override
  Widget build(BuildContext context) {
   return Padding(
     padding: const EdgeInsets.all(8.0),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        // LabelWidget(data: basicInfo.name,type: LabelType.bodyLarge,),
        // const SizedBox(height: 5,),
         Row(
           children: [
             Expanded(
               child: RichText(maxLines: 3,overflow: TextOverflow.ellipsis,text: TextSpan(text: "${basicInfo.distance} away | ",style:Theme.of(context).textTheme.bodyMedium,children:
               [
                 TextSpan(text: basicInfo.deliveryType == DeliveryType.free ?"Free Delivery | ":"Delivery Charges may Apply | ",style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700) ),
                 TextSpan(text: "Rs ${basicInfo.miniOrder}.00 Minimum | Service Fee applies")
               ],
               ),),
             ),
             const SizedBox(width: 30,),
             TextButton(onPressed: (){}, child: const LabelWidget(data: "More Info",)),
           ],


         ),
         const SizedBox(height: 5,),
         Row(
           children: [
             Image.asset(UiUtils.getImagePath(IconsConstants.starPng)),
             const SizedBox(width: 8,),
             LabelWidget(data: basicInfo.rating),
             const SizedBox(width: 8,),
             LabelWidget(data: "${basicInfo.numOfReviews} ratings",type:LabelType.bodyMedium),
           ],


         ),
         const SizedBox(height: 5,),
         Row(
           children: [
             Image.asset(UiUtils.getImagePath(IconsConstants.clockPng),height: 24,width: 24,),
             const SizedBox(width: 8,),
             LabelWidget(data: "Delivery: ${basicInfo.deliveryTime}"),
           ],


         ),



       ],
     ),
   );
  }



}