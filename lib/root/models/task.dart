

class Task {

  bool? isCompleted;
  String? content;
  String? description;
  String? duration;
  String? id;

  List<String>? comments;



  factory Task.fromJson(Map<String, dynamic> json) {
   return Task(
       isCompleted: json['is_completed'],
       content : json['content'],
       description : json['description'],
       duration : json['duration'],
       id : json['id'],);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['is_completed'] = isCompleted;
    data['content'] = content;
    data['description'] = description;

    data['duration'] = duration;
    data['id'] = id;

    return data;
  }

Task({
   this.id,
   this.description,
   this.content,
   this.duration,
   this.isCompleted,
   this.comments
});

}
