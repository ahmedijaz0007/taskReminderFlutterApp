


import 'dart:convert';

import 'package:task_reminder_updated/constants/enums.dart';
import 'package:task_reminder_updated/network/base_service.dart';

import '../../models/task.dart';

class TaskService extends BaseServices{

 Future<List<Task>> getTasks()  async {
    super.params =  <String,dynamic>{};
   var response = await execute("tasks",  HttpType.get);
    List<dynamic> jsonList = json.decode(response.body);
    return jsonList.map((json) => Task.fromJson(json)).toList();
  }


}

