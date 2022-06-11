import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/task.dart';

class TaskTile extends StatelessWidget {
  final Taskk? task;
  final int random = new Random().nextInt(4);
  
  TaskTile(this.task);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 20),
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(bottom: 12),
      child: Container(
        padding: EdgeInsets.all(16),
        //  width: SizeConfig.screenWidth * 0.78,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: _getBGClr(random),
        ),
        child: Row(children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task?.title??"", style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text(
                      "${task!.startTime} - ${task!.endTime}",
                      style: 
                        TextStyle(fontSize: 13, color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  task?.note??"",
                  style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 255, 255, 255)),
                  ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            height: 60,
            width: 0.5,
            color: Colors.grey[200]!.withOpacity(0.7),
          ),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              task!.isCompleted == 1 ? "COMPLETED" : "TODO",
              style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
        ]),
      ),
    );
  }

   _getBGClr(var no) {
    switch (no) {
      case 0:
        return Color.fromARGB(255, 52, 70, 206);
      case 1:
        return Colors.pink;
      case 2:
        return Color.fromARGB(255, 255, 128, 1);
      default:
        return Colors.green;
    }
  }
}