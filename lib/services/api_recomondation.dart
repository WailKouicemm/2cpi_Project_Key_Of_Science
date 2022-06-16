import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:keyofscience/models/Models.dart';
import 'dart:math' as math;

import '../commun/category_images.dart';





class api_service{


  Future<List<course>> getCourse(String category)async{
    try{
      List<course> list = [];
      var res = await http.get(Uri.parse('https://fastapicrs.herokuapp.com/recommand/$category'));
      var data = json.decode(res.body);
      for(int i=0;i<math.min(data.length, 10);i++){
         course tmp =  course.fromJson(data[i]);
         tmp.image=category_images[category]==null? "" : category_images[category]![i];
         list.add(tmp);
      }
      return list;
    }catch (error){
      rethrow;
    }
  }
}