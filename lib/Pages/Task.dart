import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:keyofscience/controllers/task_controller.dart';
import 'package:get/get.dart';
import '../model/datatask.dart';
import 'dart:math';

import '../presentation/resources/button.dart';
import '../presentation/resources/inputTask.dart';
import '../presentation/resources/kdefault.dart';
class Task extends StatefulWidget {

  @override
  _TaskState createState() => _TaskState();
}
  class _TaskState extends State<Task>{
    final listColors = [
      Colors.lightBlueAccent,
      Colors.amber.shade300,
      Colors.lightGreen.shade300,
      Colors.lightBlue.shade300,
      Colors.orange.shade300,
      Colors.pinkAccent.shade100,
      Colors.tealAccent.shade100
    ];
    final _random = new Random();
  DateTime _date = DateTime.now();
  String _startTime = DateFormat("hh::mm a").format(DateTime.now()).toString();
  String _endTime = "11:30 PM";
  int _remindSelection = 5;
  List<int> remindList=[
    5,
    10,
    15,
    20,
  ];
  String _repeatSelection = "None";
    List<String> repeatList=[
    "None",
    "Daily",
    "Weekly",
    "Monthly",
  ];
    final TaskController _taskController = Get.put(TaskController());
    final TextEditingController _titleController = TextEditingController();
    final TextEditingController _noteController = TextEditingController();
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: buildAppBar("Add Task"),
  body: Container(
  child: Column(
  children: [
    inputTask(titleField: "Title", hintField: "Enter your title", conroller:_titleController),
    inputTask(titleField: "Note", hintField: "Enter note here", conroller:_noteController),
    inputTask(titleField: "Date", hintField:DateFormat.yMd().format(_date),
  widget: IconButton(
  icon: const Icon(Icons.ten_k,color: Colors.grey,),
  onPressed:()=> _getDate()
  ),),
  Row(
    children: [
      Expanded(child: inputTask(titleField: 'Start Date', hintField: _startTime,
        widget:IconButton(
          onPressed: (){
          _getTime(isStartTime: true);
          },
          icon: const Icon(
            Icons.access_time_rounded,
            color:Colors.grey,
          ),
        ) ,

      )),
      const SizedBox(width: 11,),
      Expanded(child: inputTask(titleField: 'End Date', hintField: _endTime,
        widget:IconButton(
          onPressed: (){

          },
          icon: const Icon(
            Icons.access_time_rounded,
            color:Colors.grey,
          ),
        ) ,

      )),
    ],
  ),
    inputTask(titleField: "Remind", hintField: "$_remindSelection minuted early",
      widget:DropdownButton(
        icon: const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
        iconSize: 32,
        elevation: 4,
        underline: Container(height: 0,),
        onChanged: (String? newValue){
          setState(() {
            _remindSelection = int.parse(newValue!);
          }
          );
        },
        items:remindList.map<DropdownMenuItem<String>>((int value ){
          return DropdownMenuItem<String>(
            value: value.toString(),
            child: Text(value.toString()),
          );
        }
        ).toList(),
      ),
    ),
    inputTask(titleField: "Repeat", hintField: "$_repeatSelection",
      widget:DropdownButton(
        icon: const Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
        iconSize: 32,
        elevation: 4,
        underline: Container(height: 0,),
        onChanged: (String? newValue){
          setState(() {
            _repeatSelection = newValue!;
          }
          );
        },
        items:repeatList.map<DropdownMenuItem<String>>((String? value ){
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value!,style:const TextStyle(color: Colors.grey)),
          );
        }
        ).toList(),
      ),
    ),
    Container(
      margin: const EdgeInsets.only(right: 70),
      child: Button(label: "Create Task", onTap: ()=>_validateDate()),
    )
  ],
  ),
  ),
  );
  }
  _validateDate(){
    if(_titleController.text.isNotEmpty&&_noteController.text.isNotEmpty){
      // ajouter dans database
      _addTaskToDataBase();
      Get.back();
    }else if(_titleController.text.isNotEmpty || _noteController.text.isNotEmpty){
      Get.snackbar("Required", "All fields are required",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          icon:const Icon(Icons.warning_amber_rounded),
          colorText: Colors.blue,
      );
    }
  }
  _getDate() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2016), lastDate: DateTime(2121));
    if (_pickerDate!=null){
      setState(() {
        _date = _pickerDate;
      });
    }else{print("date is null");}
  }
  _getTime({required bool isStartTime}) async {
    var pickedTime =  await _showTimePicker();
    String formatedPickedTime = pickedTime.format();
    if (formatedPickedTime == null) {
      print("Time Canceled");
    } else {
      if (isStartTime == true) {
        setState(() {
          _startTime = formatedPickedTime;
        });
      } else {
        if (isStartTime == false) {
          setState(() {
            _endTime = formatedPickedTime;
          });
        }
      }
    }
  }
  _showTimePicker(){
    return showTimePicker(
      initialEntryMode:TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
          hour: int.parse(_startTime.split(":")[0]),
          minute:  int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }
  _addTaskToDataBase() async {
    int? value =  await _taskController.addTask(
        datatask:Datatask(
          note:_noteController.text,
          title:_titleController.text,
          date:DateFormat.yMd().format(_date),
          remind: _remindSelection,
          repeat: _repeatSelection ,
          startTime: _startTime,
          endTime:_endTime ,
          color: listColors[_random.nextInt(listColors.length)],
          isCompleted: 0,
        )
    );
    print("My id is "+"$value");
  }
  }
