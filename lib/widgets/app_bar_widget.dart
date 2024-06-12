import 'package:flutter/material.dart';
import 'package:foodpanda/widgets/title_widget.dart';

import '../constants/icon_constants.dart';
import '../utilities/ui_utils.dart';

class CustomAppBar extends AppBar {
   CustomAppBar(this.address, this.city, {super.key});
   final String address;
   final String city;

  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      title:  TitleWidget(address: address, city: city),
      actions: [
        IconButton(
            onPressed: () {
              //todo
            },
            icon: Image.asset(
              UiUtils.getImagePath(IconsConstants.cartPng),
              width: 32,
              height: 32,
            )),
      ],
    );
  }
}
