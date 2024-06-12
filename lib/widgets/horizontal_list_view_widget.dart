import 'package:flutter/material.dart';

import '../constants/enums.dart';
import '../utilities/ui_utils.dart';
import 'horizontal_list_item_widget.dart';
import 'label_widget.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({
    super.key,
    required this.listName,
    required this.restaurants,
  });
  final String listName;
  final List<Restaurant> restaurants;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: LabelWidget(
            data: listName,
            type: LabelType.title,
          ),
        ),
        SizedBox(
          height: UiUtils.getDeviceBasedHeight(350),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: restaurants.length,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              itemBuilder: (context, index) {
                return HorizontalListIem(
                  deliveryTime: restaurants[index].deliveryTime,
                  restaurantName: restaurants[index].name,
                  deliveryFee: restaurants[index].deliveryFee,
                  cuisine: restaurants[index].cuisine[0],
                  menu: restaurants[index].menu,
                  discount: restaurants[index].discount,
                  banner: restaurants[index].status,
                );
              }),
        )
      ],
    );
  }
}
