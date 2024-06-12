import 'package:flutter/cupertino.dart';

import '../constants/app_colors.dart';
import '../constants/enums.dart';
import 'label_widget.dart';

class ImageBanner extends StatelessWidget {
  final String data;
  const ImageBanner({
    super.key, required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container( decoration: const BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(7),
          bottomRight: Radius.circular(7),
        )

    ),child:  Padding(
      padding: const EdgeInsets.all(2.0),
      child: LabelWidget(data: data ,type: LabelType.bodySmallWhite,),
    ),);
  }
}