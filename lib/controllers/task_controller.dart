import 'package:get/get.dart';
import 'package:keyofscience/Pages/add_task_bar.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../db/tasks_database.dart';
import '../model/task.dart';

class TaskController extends GetxController{
  @override
  void onReady(){
    super.onReady();
  }

  var taskList = <Taskk>[].obs;

Future<int> addTask({Taskk? task}) async {
    return await Taskdb.insert(task);
  }


//get data from database
void getTasks() async {
    List<Map<String , dynamic>> tasks = await Taskdb.query();
  taskList.assignAll(tasks .map((data) => Taskk.fromJson(data)).toList());
}

void delete(Taskk task){
  var val = Taskdb.delete(task);
  print(val);
}

void markTaskCompleted(int? id) async{
  await Taskdb.update(id);
}
}