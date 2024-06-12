import 'package:flutter/material.dart';

import '../constants/enums.dart';

class LabelWidget extends StatelessWidget{
   const LabelWidget({super.key, required this.data,  this.type = LabelType.bodyMedium, this.maxLines = 1, this.color, this.fontWeight = FontWeight.w500});
   final String data;
   final LabelType type;
   final int? maxLines;
   final Color? color;
   final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle;
    switch (type){
      case (LabelType.title):
        textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(color: color ?? Colors.black , fontWeight: fontWeight  );
      case (LabelType.bodyLarge):
        textStyle = Theme.of(context).textTheme.bodyLarge?.copyWith(color: color ?? Colors.black , fontWeight: fontWeight  );
      case (LabelType.bodyMedium):
        textStyle = Theme.of(context).textTheme.bodyMedium?.copyWith(color: color ?? Colors.black , fontWeight: fontWeight  );
      case (LabelType.bodySmall):
        textStyle = Theme.of(context).textTheme.bodySmall;
      case (LabelType.bodySmallWhite):
        textStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          color: Colors.white, fontWeight: fontWeight
        );
    }
   return Padding(
     padding: const EdgeInsets.all(2.0),
     child: Text(data,style: textStyle,maxLines: maxLines,softWrap: true, overflow: TextOverflow.ellipsis,  ),
   );
  }
}