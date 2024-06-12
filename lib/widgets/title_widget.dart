import 'package:flutter/material.dart';
import 'package:foodpanda/constants/enums.dart';
import 'package:foodpanda/utilities/ui_utils.dart';
import 'package:foodpanda/widgets/label_widget.dart';

class TitleWidget extends StatelessWidget {
  final String address;
  final String city;

  const TitleWidget({super.key, required this.address, required this.city});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: UiUtils.getDeviceBasedWidth(100),
      child: Column(
        children: [
          LabelWidget(
              data: address, maxLines: 1, type: LabelType.bodyLarge,color: Colors.white),
          const SizedBox(
            height: 2,
          ),
          LabelWidget(
            data: city,
            maxLines: 1,
            type: LabelType.bodySmallWhite,
          )
        ],
      ),
    );
  }
}
