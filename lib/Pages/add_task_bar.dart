import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:keyofscience/Pages/home_page.dart';
import 'package:keyofscience/controllers/task_controller.dart';
import 'package:get/get.dart';
import '../Widgets/ErrorSnackbar.dart';
import '../model/task.dart';
import 'dart:math';

import '../notification/notifications.dart';
import '../presentation/resources/button.dart';
import '../presentation/resources/inputTask.dart';
import '../presentation/resources/kdefault.dart';
class Tasks extends StatefulWidget {
  final bool fromHome;
  const Tasks({this.fromHome=false});

  @override
  _TaskState createState() => _TaskState();
}
  class _TaskState extends State<Tasks>{
  
  var notifyHelper = NotifyHelper();

  @override
  void initState() {
    super.initState();
     //notifyHelper = new NotifyHelper();
     notifyHelper.initializeNotififaction();
    // //NotifyHelper.requestIOSPermissions();
  }
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
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
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
    backgroundColor: Colors.white,
  appBar: buildAppBar("Add Task"),
  body: SingleChildScrollView(
    child: Container(
    child: Column(
    children: [
      inputTask(titleField: "Title", hintField: "Enter your title", conroller:_titleController),
      inputTask(titleField: "Note", hintField: "Enter note here", conroller:_noteController),
      inputTask(titleField: "Date", hintField:DateFormat.yMd().format(_date),
    widget: IconButton(
    icon: const Icon(Icons.calendar_month , color: Colors.black,),
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
              color:Colors.black,
            ),
          ) ,
  
        )),
        const SizedBox(width: 11,),
        Expanded(child: inputTask(titleField: 'End Date', hintField: _endTime,
          widget:IconButton(
            onPressed: (){
             _getTime(isStartTime: false);
            },
            icon: const Icon(
              Icons.access_time_rounded,
              color:Colors.black,
            ),
          ) ,
  
        )),
      ],
    ),
      inputTask(titleField: "Remind", hintField: "$_remindSelection minuted early",
        widget:DropdownButton(
          icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
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
              child: Text(value.toString(), style: const TextStyle(color: Colors.black ),),
            );
          }
          ).toList(),
        ),
      ),
      inputTask(titleField: "Repeat", hintField: _repeatSelection,
        widget:DropdownButton(
          icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
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
              child: Text(value!,style:const TextStyle(color: Colors.black)),
            );
          }
          ).toList(),
        ),
      ),
      Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: Button(label: "Create Task", 
        onTap: (){ 
        _validateDate(fromHome:widget.fromHome);
        _taskController.getTasks();
        }),
      )
    ],
    ),
    ),
  ),
  );
}


  _validateDate({bool fromHome = false}){
    if(_titleController.text.isNotEmpty && _noteController.text.isNotEmpty){
      //ajouter dans database
    _addTaskToDataBase();
    fromHome?
    Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => const Schedule_page()),) : Navigator.pop(context);
    }else if(_titleController.text.isEmpty || _noteController.text.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(snackerror("Required!", "all field mustn't be empty !",context) );
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
    String formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print("Time Canceled");
    } else {
      if (isStartTime == true) {
        setState(() {
          _startTime = formatedTime;
        });
      } else {
        if (isStartTime == false) {
          setState(() {
            _endTime = formatedTime;
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
          minute:  int.parse(_endTime.split(":")[1].split(" ")[0]),
      ),
    );
  }
  _addTaskToDataBase() async {
    int value =  await _taskController.addTask(
        task:Taskk(
          note:_noteController.text,
          title:_titleController.text,
          date:DateFormat.yMd().format(_date),
          remind: _remindSelection,
          repeat: _repeatSelection ,
          startTime: _startTime,
          endTime:_endTime ,
          //color: Colors.white,
          isCompleted: 0,
        )
    );
    print("My id is " + "$value");
  }
  }



  class Schedule_page extends StatelessWidget {
    const Schedule_page({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar:  AppBar(
          elevation: 0.0,
          title: Text("SCHEDULE")
          //  flexibleSpace: Image.asset(images.appBarImage,fit: BoxFit.cover,),
        ),
        body: Schedule(),
      );
    }
  }
