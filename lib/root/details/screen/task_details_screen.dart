import 'dart:async';

import 'package:flutter/material.dart';
import 'package:task_reminder_updated/constants/app_colors.dart';

import '../../../utilities/ui_utils.dart';
import '../../models/task.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.task});
  final Task task;

  @override
  State<StatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var controller = TextEditingController();
  int tickCount = 0;
  bool isTimerStarted = false;
  Timer? timer;

  void startTimer() {
    timer?.cancel(); // Cancel any existing timer
    setState(() {
      isTimerStarted = true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        tickCount++;
      });
    });
  }

  void stopTimer() {
    timer?.cancel();
    setState(() {
      isTimerStarted = false;
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var myTask = widget.task;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text("Task Details"),
          backgroundColor: Colors.transparent,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  UiUtils.getImagePath("background.png", isCommon: true)),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${tickCount ~/ 3600}  : ${tickCount ~/ 60} : ${tickCount % 60}',
                            style: const TextStyle(
                                fontSize: 48, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: isTimerStarted ? null : startTimer,
                                child: const Text('Start Timer'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                onPressed: isTimerStarted ? stopTimer : null,
                                child: const Text('Stop Timer'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(myTask.title ?? ""),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(myTask.description ?? ""),
                            const SizedBox(
                              height: 2,
                            ),
                            Text("completed date"),
                            const SizedBox(
                              height: 2,
                            ),
                            const Text("time taken"),
                            const SizedBox(
                              height: 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                          children: [
                            Card(
                              child: IconButton(
                                  onPressed: () {},color: AppColors.primaryColor ,icon: const Icon(Icons.edit)),
                            ),
                            Card(
                              child: IconButton(
                                  onPressed: () {},color: AppColors.primaryColor , icon: const Icon(Icons.delete)),
                            ),
                                                          ],
                                                        ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      TextField(
                        controller: TextEditingController(),
                        decoration: const InputDecoration(
                            hintText: "Enter Comment",
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                myTask.comments?.insert(0, controller.text);
                                controller.clear();
                              });
                            },
                            child: const Text("Submit")),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: myTask.comments?.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              myTask.comments?[index] ?? "comment",
                              softWrap: true,
                              maxLines: 5,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
        ));
  }
}
