import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../db/tasks_database.dart';
import '../model/datatask.dart';

class TaskController extends GetxController{
  @override
  void onReady(){
    super.onReady();
  }
  Future<int>? addTask({Datatask? datatask}) async {
    return await Taskdb.insert(datatask) ;
  }
  var taskList = <Datatask>[].obs;
  // get data from table of data
/*void getTasks() async {
    List<Map<String , dynamic>> tasks = await Taskdb.query();
  taskList.assignAll(tasks.map((data) => Datatask.fromJson(data)).toList());
}*/

}