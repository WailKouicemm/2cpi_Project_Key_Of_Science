


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keyofscience/models/Models.dart';
import 'package:uuid/uuid.dart';
 
class trySErvice{

  static List<course> list  = const [
    // course(image: "assets/try/image1.jpg", title: 'photoshop ', lessonsNumber: "10", category: "Design UI/UX"),
    // course(image: "assets/try/image2.jpg", title: 'Ai ', lessonsNumber: "10",category: "Ai"),
    // course(image: "assets/try/image3.jpg", title: 'Data Structure ', lessonsNumber: "10",category:"Data Structure" ),
    // course(image: "assets/try/image4.jpg", title: 'web dev ', lessonsNumber: "10",category: "Web development"),
    // course(image: "assets/try/image5.png", title: 'android dev ', lessonsNumber: "10",category: "Mobile developement"),
  ];




  static final _firestoreInstance =  FirebaseFirestore.instance.collection("coursesss");
 static  Future set(int i )async{
   try{
     list.forEach((element) async{
       print("eneter to this ");
       await _firestoreInstance.doc().set({
         "title": element.title+" $i",
         "category":element.category,
         "content": "description",
         "images": element.image,
         "link": "link",
         "leader": element.creator,
         "date": Timestamp.now(),
         "id": const Uuid().v1()
       });
     });
   }catch (e){
     print("error in ierieorkzer $e");
   }

}
}



class courses_service{
    courses_service();
   static final  _firestoreInstance =  FirebaseFirestore.instance;
   Future<QuerySnapshot<Map<String, dynamic>>> getCourses({required int documentLimit,
   required String category,required startAfter,books=false})async{
    try{
      String collectionName = books? "books" : "coursesss";

      final QuerySnapshot<Map<String, dynamic>> res;
      var instance = category=="all" ? _firestoreInstance.collection(collectionName) :
      _firestoreInstance.collection(collectionName).where("category",isEqualTo: category);
      if(startAfter == null){
        res = await instance.orderBy("date",descending: true).limit(documentLimit).get();
      }else{
        res = await instance.orderBy("date",descending: true).startAfterDocument(startAfter!).limit(documentLimit).get();
      }

      // for(int i=0;i<res.docs.length;i++){
      //   list.add(res.docs[i].data());
      // }
      return res;
    }catch (error){
      rethrow;
    }
  }

   static Future<void> IncerementClicks(String id,{bool isBooks=false})async{
     try{
       String collectionName = isBooks? "books" : "coursesss";
       var q= _firestoreInstance.collection(collectionName).doc(id);
       await q.update({"clicks": FieldValue.increment(1)});
     }catch (_){}
    }
    static Future<void> IncerementViews(String id,{bool isBooks=false})async{
     try{
       String collectionName = isBooks? "books" : "coursesss";
       var q= _firestoreInstance.collection(collectionName).doc(id);
       await q.update({"views": FieldValue.increment(1)});
     }catch (_){}
    }


}