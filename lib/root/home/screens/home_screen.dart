

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_reminder_updated/root/home/services/task_service.dart';

import '../../models/task.dart';
import '../../widgets/task_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
    late Future <List<Task>> tasks;
  @override
  void initState() {
    _getTasks();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    super.initState();
  }
  _getTasks() async{
    tasks =  TaskService().getTasks();
    print("tasks are here");
  }

  @override
  Widget build(BuildContext context) {
     return  SafeArea(
       child: SingleChildScrollView(
         child: FutureBuilder<List<Task>>(future: tasks, builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
     {
       List<Widget> children;
       if (snapshot.hasData) {
         print("data is here");
         children = [
           TaskList(tasks: snapshot.data ?? [] , type: 'In Progress',),
           const SizedBox(height: 7,),
           TaskList(tasks: snapshot.data ?? [], type: 'To Do',),
           const SizedBox(height: 7,),
           TaskList(tasks: snapshot.data ?? [], type: 'Done',),
         ];
       } else {
         children = [ CircularProgressIndicator()];
       }
       return Center(
         child: Column(
           children: children,
         ),
       );
     }
     ),
     )
     );
  }
  
}

// Column(
// children: [
// TaskList(tasks: tasks ?? [] , type: 'In Progress',),
// const SizedBox(height: 7,),
// TaskList(tasks: tasks ?? [], type: 'To Do',),
// const SizedBox(height: 7,),
// TaskList(tasks: tasks ?? [], type: 'Done',),
// ],
// ),