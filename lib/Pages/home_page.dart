import 'dart:io';

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:keyofscience/Pages/add_task_bar.dart';
import 'package:keyofscience/model/task.dart';
import 'package:keyofscience/notification/notifications.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/kdefault.dart';
import '../Widgets/tasktile.dart';
import '../controllers/task_controller.dart';
import '../presentation/resources/button.dart';
class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);
  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

var notifyHelper;
  @override
  void initState() {
    super.initState();
    notifyHelper = new NotifyHelper();
    notifyHelper.initializeNotififaction();
    //NotifyHelper.requestIOSPermissions();
  }

  DateTime _selecteddate = DateTime.now() ;
  final TaskController _taskController = Get.put(TaskController());
  @override
  Widget build(BuildContext context) {
    _taskController.getTasks();
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        body: Column(
          children: [
            _addTask(),
            _addDateBar(),
            const SizedBox(height: 10.0,),
             Expanded(
        child: Obx((){
          return SizedBox(
            height: double.infinity,
            child: ListView.builder(
              itemCount: _taskController.taskList.length,
              itemBuilder: (context,index){
                  Taskk task = _taskController.taskList[index];
                  String a =_selecteddate.toString().split(" ")[0].split("-")[2];
                  int b = int.parse(task.date!.split('/')[1].split('/')[0].toString()); 
                  int c = int.parse(a);              
                  if(task.repeat == "Weekly"){
                    for (int i = 0; i<=4 ; i++){
                      if((c == b+(i*7)) || ( c == b-(i*7))){
                     notifyHelper.scheduledNotification(
                      int.parse(task.startTime.toString().split(":")[0]),
                      int.parse(task.startTime.toString().split(":")[1].split(" ")[0])-int.parse(task.remind.toString()),
                      task
                    );
                      return AnimationConfiguration.staggeredList(
                    position: index, 
                    child: SlideAnimation(
                      child:FadeInAnimation(
                        child:Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                               showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                   return Container(
                                   height: _taskController.taskList[index].isCompleted==1?
                                   MediaQuery.of(context).size.height*0.20:
                                   MediaQuery.of(context).size.height*0.32 ,
                                   color: Colors.white,
                                   child: Column(
                                       children: [
                                        const SizedBox(height: 10.0,),
                                        Container(
                                         height: 6.0,
                                         width: 80.0,
                                         decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         color: Colors.grey[300]
                                         ),
                                        ),
                                      _taskController.taskList[index].isCompleted==1?Container(
                                      ):
                                       const SizedBox(height: 20.0,),
                                      _taskController.taskList[index].isCompleted==0?buttonsheet("Task Completedd", () {
                                        _taskController.markTaskCompleted(_taskController.taskList[index].id);
                                        _taskController.getTasks();
                                        Navigator.of(context).pop(
                                         MaterialPageRoute(builder: (context) => const Schedule()),);
                                      }, context, const Color.fromARGB(255, 52, 70, 206) ,const Color.fromARGB(255, 52, 70, 206), Colors.white):
                                     Container(),
                                     
                                      buttonsheet("Delete Task", () {
                                        _taskController.delete(_taskController.taskList[index]);
                                        _taskController.getTasks();
                                        Navigator.of(context).pop(
                                         MaterialPageRoute(builder: (context) => const Schedule()),);
                                      }, context, Colors.red , Colors.red, Colors.white),
                                      const SizedBox(height: 15.0,),            
                                      buttonsheet("Close", (){}, context, Colors.white, Colors.black, Colors.black)           
                                     ],
                                   )
                                  );
                                 },
                                );
                              },
                              child: TaskTile(_taskController.taskList[index]),
                            )
                          ],) ,
                         ) 
                        )
                    );
                    }
                  }
                      }
            
                  if(task.repeat == "Monthly"){
                    if(a == task.date!.split('/')[1].split('/')[0]){
                       notifyHelper.scheduledNotification(
                      int.parse(task.startTime.toString().split(":")[0]),
                      int.parse(task.startTime.toString().split(":")[1].split(" ")[0])-int.parse(task.remind.toString()),
                      task
                    );
                      return AnimationConfiguration.staggeredList(
                    position: index, 
                    child: SlideAnimation(
                      child:FadeInAnimation(
                        child:Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                               showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                   return Container(
                                   height: _taskController.taskList[index].isCompleted==1?
                                   MediaQuery.of(context).size.height*0.20:
                                   MediaQuery.of(context).size.height*0.32 ,
                                   color: Colors.white,
                                   child: Column(
                                       children: [
                                        const SizedBox(height: 10.0,),
                                        Container(
                                         height: 6.0,
                                         width: 80.0,
                                         decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         color: Colors.grey[300]
                                         ),
                                        ),
                                      _taskController.taskList[index].isCompleted==1?Container(
                                      ):
                                        const SizedBox(height: 20.0,),
            
            
                                      _taskController.taskList[index].isCompleted==0?buttonsheet("Task Completedd", () {
                                        _taskController.markTaskCompleted(_taskController.taskList[index].id);
                                        _taskController.getTasks();
                                        Navigator.of(context).pop(
                                         MaterialPageRoute(builder: (context) => const Schedule()),);
                                      }, context, const Color.fromARGB(255, 52, 70, 206) ,const Color.fromARGB(255, 52, 70, 206), Colors.white):
                                     Container(),
                                     
                                      buttonsheet("Delete Task", () {
                                        _taskController.delete(_taskController.taskList[index]);
                                        _taskController.getTasks();
                                        Navigator.of(context).pop(
                                         MaterialPageRoute(builder: (context) => const Schedule()),);
                                      }, context, Colors.red , Colors.red, Colors.white),
                                      const SizedBox(height: 15.0,), 
                                      buttonsheet("Close", (){}, context, Colors.white, Colors.black, Colors.black)
                                          ],
                                         )
                                       );
                                      },
                                    );
                              },
                              child: TaskTile(_taskController.taskList[index]),
                            )
                          ],) ,
                         ) 
                        )
                    );
                    }
                  }
                  if(task.repeat == "Daily"){
                    notifyHelper.scheduledNotification(
                      int.parse(task.startTime.toString().split(":")[0]),
                      int.parse(task.startTime.toString().split(":")[1].split(" ")[0])-int.parse(task.remind.toString()),
                      task
                    );
                    return AnimationConfiguration.staggeredList(
                    position: index, 
                    child: SlideAnimation(
                      child:FadeInAnimation(
                        child:Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                               showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                   return Container(
                                   height: _taskController.taskList[index].isCompleted==1?
                                   MediaQuery.of(context).size.height*0.20:
                                   MediaQuery.of(context).size.height*0.32 ,
                                   color: Colors.white,
                                   child: Column(
                                       children: [
                                       const   SizedBox(height: 10.0,),
                                        Container(
                                         height: 6.0,
                                         width: 80.0,
                                         decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         color: Colors.grey[300]
                                         ),
                                        ),
                                      _taskController.taskList[index].isCompleted==1?Container(
                                      ):
                                      const SizedBox(height: 20.0,),
                                      _taskController.taskList[index].isCompleted==0?buttonsheet("Task Completedd", () {
                                        _taskController.markTaskCompleted(_taskController.taskList[index].id);
                                        _taskController.getTasks();
                                        Navigator.of(context).pop(
                                         MaterialPageRoute(builder: (context) => Schedule()),);
                                      }, context,const Color.fromARGB(255, 52, 70, 206) , const Color.fromARGB(255, 52, 70, 206), Colors.white):
                                     Container(),
                                     
                                      buttonsheet("Delete Task", () {
                                        _taskController.delete(_taskController.taskList[index]);
                                        _taskController.getTasks();
                                        Navigator.of(context).pop(
                                         MaterialPageRoute(builder: (context) => const Schedule()),);
                                      }, context, Colors.red , Colors.red, Colors.white),
                                      const SizedBox(height: 15.0,),
                                      buttonsheet("Close", (){}, context, Colors.white, Colors.black, Colors.black)
                                     
                                            ],
                                          )
                                        );
                                      },
                                    );
                              },
                              child: TaskTile(_taskController.taskList[index]),
                            )
                          ],) ,
                         ) 
                        )
                    );
                 }
                 if(task.date == DateFormat.yMd().format(_selecteddate)){
                    
                  notifyHelper.scheduledNotification(
                      int.parse(task.startTime.toString().split(":")[0]),
                      int.parse(task.startTime.toString().split(":")[1].split(" ")[0]) - int.parse(task.remind.toString()),
                      task
                    );
                     return AnimationConfiguration.staggeredList(
                    position: index, 
                    child: SlideAnimation(
                      child:FadeInAnimation(
                        child:Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                               showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                   return Container(
                                   height: _taskController.taskList[index].isCompleted==1?
                                   MediaQuery.of(context).size.height*0.20:
                                   MediaQuery.of(context).size.height*0.32 ,
                                   color: Colors.white,
                                   child: Column(
                                       children: [
                                        const SizedBox(height: 10.0,),
                                        Container(
                                         height: 6.0,
                                         width: 80.0,
                                         decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(10),
                                         color: Colors.grey[300]
                                         ),
                                        ),
                                      _taskController.taskList[index].isCompleted==1?Container(
                                      ):
                                       const SizedBox(height: 20.0,),
            
            
                                      _taskController.taskList[index].isCompleted==0?buttonsheet("Task Completed", () {
                                        _taskController.markTaskCompleted(_taskController.taskList[index].id);
                                        _taskController.getTasks();
                                        Navigator.of(context).pop(
                                         MaterialPageRoute(builder: (context) => const Schedule()),);
                                      }, context, const Color.fromARGB(255, 52, 70, 206) , const Color.fromARGB(255, 52, 70, 206), Colors.white):
                                     Container(),
                                     
                                      buttonsheet("Delete Task", () {
                                        _taskController.delete(_taskController.taskList[index]);
                                        _taskController.getTasks();
                                        Navigator.of(context).pop(
                                         MaterialPageRoute(builder: (context) => const Schedule()),);
                                      }, context, Colors.red , Colors.red, Colors.white),
                                      const SizedBox(height: 15.0,),
                                    
                                    
                                      buttonsheet("Close", (){
                                        Navigator.of(context).push(
                                         MaterialPageRoute(builder: (context) => const Schedule()),);
                                      }, context, Colors.white, Colors.black, Colors.black)
                                     
                                           ],
                                         )
                                       );
                                     },
                                   );
                              },
                              child: TaskTile(_taskController.taskList[index]),
                            )
                          ],) ,
                         ) 
                        )
                    );
                 }else{
                   return Container();
                 }
                  
            }),
          );
  }),
  )

              ],
            )
      ),
    );
  }

  _addDateBar(){
    return Container(
            margin: const EdgeInsets.only(top: 10.0, left: 5.0),
            child: DatePicker(
              DateTime.now(),
              height: 100,
              width: 80,
              initialSelectedDate: DateTime.now(),
              selectionColor:const Color.fromARGB(255, 52, 70, 206),
              selectedTextColor: Colors.white,
              onDateChange: (date){
                setState(() {
                  
                });
                  _selecteddate = date;
              },
            ),
          );
  }

  _addTask(){
    return Container(
      margin: const EdgeInsets.only(left: 15,right: 20,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( DateFormat.yMMMMd().format(DateTime.now()) ,style: const TextStyle(fontFamily: "Montserrat",fontSize: 21,color: Colors.black),),
                  const Text("Today",style:TextStyle(fontFamily: "Montserrat",fontSize: 14,color: Colors.black)),
                ],
              )
          ),
    Button(
      label: "Add Task", 
      onTap: ()async{
     await Navigator.of(context).push(
     MaterialPageRoute(builder: (context) => Tasks()),);

    _taskController.getTasks();
    }
    ),
        ],
      ),
    );
  }
 _dateList(){return Container(
    margin: const EdgeInsets.only(left:20,right:20,top: 20),
  );
  }
}

buttonsheet( String? label , Function()? fcts , context ,  Color clr ,  Color clrborder ,  Color clrtext ,{bool isClose = false}) => GestureDetector(
                                    onTap: fcts,
                                    child: Container(
                                    child: Center(child: Text("$label", style: TextStyle(color: clrtext, fontWeight: FontWeight.bold),)),
                                    margin: const EdgeInsets.only(top:10.0),
                                    height: 45.0,
                                    width: MediaQuery.of(context).size.width*0.9,
                                     //color: Colors.blue,
                                    decoration: BoxDecoration(
                                    color: clr,
                                    border: Border.all(
                                    width: 1.0,
                                    color: clrborder,
                                    ),
                                    borderRadius: BorderRadius.circular(15.0),
                                    ),
                                   ),
                                  );

