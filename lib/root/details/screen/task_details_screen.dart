import 'dart:async';

import 'package:flutter/material.dart';

import '../../../utilities/ui_utils.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<StatefulWidget> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>{



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
  Widget build(BuildContext context) {
   return Scaffold(
     extendBodyBehindAppBar: true,
     appBar: AppBar(title: const Text("Task Details"),backgroundColor: Colors.transparent,),
     body: Container(
    decoration:  BoxDecoration(
    image: DecorationImage(
    image: AssetImage(UiUtils.getImagePath("background.png",isCommon:true)),
    fit: BoxFit.cover,
    ),
    ),
       child: SafeArea(
         child: Column(
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Card(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text(
                         '${tickCount~/3600}  : ${tickCount~/60} : ${tickCount%60}',
                         style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                       ),
                       const SizedBox(height: 20),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           ElevatedButton(
                             onPressed: isTimerStarted? null:startTimer,
                             child: const Text('Start Timer'),
                           ),
                           const SizedBox(width: 10,),
                           ElevatedButton(
                             onPressed: isTimerStarted? stopTimer:null,
                             child: const Text('Stop Timer'),
                           ),
                         ],
                       ),

                     ],
                   ),
                 ),
               ),
             ),
             const SizedBox(height: 5,),
             const SizedBox(
               width: double.infinity,
               child:  Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Card(
                   child: Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,

                       children: [
                       Text("title"),
                       SizedBox(height: 2,),
                       Text("description"),
                       SizedBox(height: 2,),
                       Text("completed date"),
                       SizedBox(height: 2,),
                       Text("time taken"),



                     ],),
                   ),
                 ),
               ),
             ),
             const SizedBox(height: 8,),
             ListView.builder(itemBuilder: (context,index){

             })
           ],
         ),
       ),
     )
   );
  }

}