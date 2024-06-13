

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/task.dart';
import '../../widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  final tasks = [Task(id: '1', title: 'HAHAH', description: 'DASDASDASD'),Task(id: '2', title: 'ADSVSDSD', description: 'DASDASD')];
  @override
  Widget build(BuildContext context) {
     return  SafeArea(
       child: SingleChildScrollView(
         child: Column(
           children: [
             TaskList(tasks: tasks, type: 'In Progress',),
             const SizedBox(height: 7,),
             TaskList(tasks: tasks, type: 'To Do',),
             const SizedBox(height: 7,),
             TaskList(tasks: tasks, type: 'Done',),
           ],
         ),
       ),
     );
  }
  
}

