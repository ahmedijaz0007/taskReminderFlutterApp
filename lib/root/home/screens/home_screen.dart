

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
  final tasks = [Task(id: '', title: '', description: ''),Task(id: '', title: '', description: '')];
  @override
  Widget build(BuildContext context) {
     return  SafeArea(
       child: Column(
         children: [
           TaskList(tasks: tasks, type: 'In Progress',),
           const SizedBox(height: 7,),
           TaskList(tasks: tasks, type: 'In Progress',),
           const SizedBox(height: 7,),
           TaskList(tasks: tasks, type: 'In Progress',),
         ],
       ),
     );
  }
  
}

