



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/Models.dart';

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

static Future<bool> isRegistered(String id)async{
   try{
      final String email = FirebaseAuth.instance.currentUser!.email ?? '';
      final inst = await FirebaseFirestore.instance.collection("mine_books_corses").
      doc(email).collection("my_courses_id").where("Enrollment",isEqualTo: id).limit(1).get();
      return inst.docs.isNotEmpty;
    }catch(error){
     print("error in isRegistered from firebase error => $error");
   return false;
   }
}

}

class myCourses_service{
  static final String email = FirebaseAuth.instance.currentUser!.email ?? '';
  static Future<List<course>> getMycourses()async{
    try{
      List<course> myList = [];
      final inst = FirebaseFirestore.instance.collection("mine_books_corses").doc(email).collection("my_courses");
      var res = await inst.orderBy("date",descending: true).get();
      if(res.docs.isNotEmpty){
        for (var element in res.docs) {
          myList.add(course.fromJson(element.data()));
        }
      }
      return myList;
    }catch (_){
      return [];
    }
  }

  static Future<void> add_myCoursese(course cours)async{
    try{
      final x = FirebaseFirestore.instance.collection("mine_books_corses").doc(email);
      final inst = x.collection("my_courses");
      await inst.add({
        'Title' : cours.title,
        'Enrollment' : cours.id,
        'Summary' : cours.content,
        'image' : cours.image,
        'date' : Timestamp.now(),
      });
       // await x.collection("my_courses_id").add({
       //   ""
       // });
    }catch (_){
    }
  }


  static Future<void> add_mmyBooks(String id)async{
    try{
      final inst = FirebaseFirestore.instance.collection("mine_books_corses").doc(email).collection("my_books");
      await inst.add({
        "id" : id,
        "date" : Timestamp.now()
      });

    }catch (_){
    }
  }

  static Future<List<Book>> get_myBooks()async{
    try{
      List<Book> myList = [];
      final inst = FirebaseFirestore.instance.collection("mine_books_corses").doc(email).collection("my_books");
      var res = await inst.orderBy("date",descending: true).get();
      if(res.docs.isNotEmpty){
        for (var element in res.docs) {
          Book book = await getBook(element.data()['id']);
          myList.add(Book.fromJson(element.data()));
        }
      }
      return myList;
    }catch (_){
      return [];
    }
  }

  static Future<Book> getBook(String id)async{

    final inst = FirebaseFirestore.instance.collection("books").where("id",isEqualTo: id);
    var res = await inst.get();
    Book book = Book.fromJson(res.docs[0].data());
    print(book);
    return book;

  }

}


class verifyIFregistered_in_cours{
  static final String email = FirebaseAuth.instance.currentUser!.email ?? '';
  static Future<bool> isRegistered(String id)async{
    return course_service.isRegistered(id);
    // try{
    // SharedPreferences inst = await SharedPreferences.getInstance();
    // bool? registered = inst.getBool(id);
    // if(registered==null) {
    //   return false;
    // }
    // return true;
    // final inst = await FirebaseFirestore.instance.collection("mine_books_corses").
    // doc(email).collection("my_courses_id").where("Enrollment",isEqualTo: id).limit(1).get();
    // return inst.docs.isNotEmpty;
    // }catch (_){
    //   return false;
    // }
  }

  static Future<void> register(String id)async{
    try{
      // SharedPreferences inst = await SharedPreferences.getInstance();
      // inst.setBool(id, true);
      final inst = FirebaseFirestore.instance.collection("mine_books_corses").doc(email).collection("my_courses_id");
      inst.doc().set({
        'Enrollment': id
      });
    }catch (_){}
  }

}

