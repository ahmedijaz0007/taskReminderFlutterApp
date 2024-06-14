import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_reminder_updated/constants/app_colors.dart';
import 'package:task_reminder_updated/utilities/ui_utils.dart';

import '../models/task.dart';

class TaskList extends StatelessWidget{
  final List<Task> tasks;
  final String type;

  const TaskList({super.key, required this.tasks, required this.type});
  @override
  Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.all(8.0),
       child: Column(
         children: [
           Row(
             children: [
               Text(type),
               const SizedBox(width: 5,),
               Container(
                 decoration: const BoxDecoration(
                   shape: BoxShape.circle,
                   color: AppColors.secondaryColor,
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(4.0),
                   child: Text((tasks.length).toString(),style: const TextStyle(color: AppColors.primaryColor),),
                 ),
               ),

             ],
           ),
           const SizedBox(height: 5,),
           SizedBox(
             height: UiUtils.getDeviceBasedHeight(150),
             child: ListView.builder(
               scrollDirection: Axis.horizontal,
                 itemCount: tasks.length,
                 itemBuilder: (context,index){
               return InkWell(
                 onTap: (){
                   context.pushNamed("details");
                 },
                 child: SizedBox(
                   key: ValueKey(tasks[index].id),
                   width: UiUtils.getDeviceBasedWidth(250),
                   child:  Card(
                     color: AppColors.secondaryColor,
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(tasks[index].title ?? "",maxLines: 1,softWrap: true,overflow: TextOverflow.fade),
                           const SizedBox(height: 5,),
                           Text(tasks[index].description ?? "",maxLines: 2,softWrap: true,overflow: TextOverflow.fade),
                         ],
                       ),
                     )
                   ),
                 ),
               );
             }),
           ),
         ],
       ),
     );
  }

}