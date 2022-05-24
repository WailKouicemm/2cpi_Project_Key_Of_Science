import 'package:flutter/material.dart';
import 'package:keyofscience/Pages/Task.dart';
import 'package:keyofscience/presentation/resources/kdefault.dart';
import '../presentation/resources/button.dart';
class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Schedule"),
      body: Column(
        children: [
          _addTask(),
          _dateList(),
            ],
          )
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
                children: const [
                  Text("22 March 2022",style: TextStyle(fontFamily: "Montserrat",fontSize: 21,color: Colors.black),),
                  Text("Today",style:TextStyle(fontFamily: "Montserrat",fontSize: 14,color: Colors.black)),
                ],
              )
          ),
           Button(label: "Add Task", onTap: () async {
    await Navigator.of(context).push(
    MaterialPageRoute(builder: (context) => Task()),);}),
        ],
      ),
    );
  }
  _dateList(){return Container(
    margin: const EdgeInsets.only(left:20,right:20,top: 20),
  );
  //_showTasks();
  }
}
/*_showTasks(){
  return Expanded(
      child: Obx((){
        return ListView.builder(
          itemCount: _taskController.taskList.length,,
            itemBuilder: (_,context){
              return Container(
                width: 100,
                height: 50,
                color:Colors.green,

              );
        });
  }),
  );*/
