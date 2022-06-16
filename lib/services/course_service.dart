



import 'package:shared_preferences/shared_preferences.dart';

class course_service{



 static Future<List<String>> getCourseMap(String id)async{
    try{
      print("88888888888888888888888888888888888888888 $id");

      SharedPreferences inst = await SharedPreferences.getInstance();
      List<String>? list = inst.getStringList(id+'xx');

      print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx $list");
       return list ?? [];
    }catch (e){
      print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeev $e");

      return [];
    }
  }

 static Future<void> setVideo_toReaded(String id, String title)async{
    try{
      print("idddddddddddddidddddddddddddddd $id");
      SharedPreferences inst = await SharedPreferences.getInstance();
      List<String>? list = inst.getStringList(id+'xx');

      if(list==null){
        list = [title];
      }else if(!list.contains(title)){
        list.add(title);
      }
      print("llllllllliiiiiillllilillililililililililliliilil $list");

      inst.setStringList(id+'xx', list);
    }catch (e){
      print("error in setvideo $e");
    }
  }



}