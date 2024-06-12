import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:foodpanda/constants/enums.dart';
import 'package:foodpanda/routes/routes.dart';
import 'package:foodpanda/widgets/container_widget.dart';
import 'package:foodpanda/widgets/label_widget.dart';

import 'image_banner_widget.dart';
import 'image_label_widget.dart';

class HorizontalListIem extends StatelessWidget {
  const HorizontalListIem({
    super.key,
    this.discount,
    this.banner,
    required this.deliveryTime,
    required this.restaurantName,
    required this.deliveryFee,
    required this.cuisine,
    required this.menu,
  });
  final int? discount;
  final String? banner;
  final int deliveryTime;
  final String restaurantName;
  final int deliveryFee;
  final String cuisine;
  final List<String> menu;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0,top: 2.0,right: 8,bottom: 5),
      child: InkWell(
        onTap: (){
          context.router.pushNamed(AppRoutes.restaurant);
        },
        child: ContainerWidget(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  const ClipRRect(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(8),topLeft: Radius.circular(8)),
                      child: Image(
                        image: ResizeImage(AssetImage("assets/common/images/black.jpg"),
                            width: 300, height: 200),
                        fit: BoxFit.contain,
                        color: Colors.black,
                      )),
                  Positioned(
                    top: 8,
                    child: Visibility(
                      visible: discount != null && discount != 0 ? true : false,
                      child: ImageBanner(data: "$discount% off"),
                    ),
                  ),
                   Positioned(
                    top: 38,
                    child:Visibility(
                      visible: banner != null ? true : false,
                      child:  ImageBanner(
                        data: banner?? "",
                      ),
                    ),
                  ),
                   Positioned(
                    bottom: 10,
                    left: 8,
                    child: ImageLabel(data: "$deliveryTime mins"),
                  )
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              LabelWidget(
                data: restaurantName,
                type: LabelType.bodyLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                width: 270,
                child: LabelWidget(
                  data: "\$\$ $cuisine,$menu",
                  type: LabelType.bodyMedium,maxLines: 1,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              LabelWidget(
                data: "PKR $deliveryFee delivery Fee",
                type: LabelType.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
