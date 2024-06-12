import 'package:equatable/equatable.dart';

class Task {
  String id;

  String title;

  String description;

  String status; // 'To Do', 'In Progress', 'Done'

  Duration timeSpent;

  List<String> comments;

  DateTime? completedDate;

  bool isOngoing = false;
  DateTime? startTime;

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.status = 'To Do',
    this.timeSpent = Duration.zero,
    this.comments = const [],
    this.completedDate,
  });

}
