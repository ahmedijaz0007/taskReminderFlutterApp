import 'package:flutter/cupertino.dart';

import '../constants/app_colors.dart';
import '../constants/enums.dart';
import 'label_widget.dart';

class ImageLabel extends StatelessWidget {
  const ImageLabel({
    super.key, required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Container( decoration:  BoxDecoration(
      color: AppColors.secondaryColor,
      borderRadius: BorderRadius.circular(10),
    ),child:   Padding(
      padding: const EdgeInsets.all(1.5),
      child: LabelWidget(data: data ,type: LabelType.bodySmall,),
    ),);
  }
}