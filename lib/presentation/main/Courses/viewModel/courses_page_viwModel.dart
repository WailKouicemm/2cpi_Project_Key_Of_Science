import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/services/courses_service.dart';

import '../../../../models/Models.dart';


class courses_viewmodel extends ChangeNotifier{
  Map<String,List<course>> courses = {};
  Map<String,List<Book>> books = {};
  final int documentLimit = 2;
  bool isLoading = false;
  bool hasMore = true;
  final courses_service _service = courses_service();
  DocumentSnapshot? startAfter = null;

  // List<course> list = const [
  //   course(
  //       image: 'assets/images/java.jpg',
  //       title: 'introduction',
  //       lessonsNumber: '29 lesson'),
  //   course(
  //       image: 'assets/images/illustrator.jpeg',
  //       title: 'Illustrator CC Full Course',
  //       lessonsNumber: '29 lesson'),
  //   course(
  //       image: 'assets/images/ae.jpg',
  //       title: 'intoduction to ui utilization of after Effects',
  //       lessonsNumber: '29 lesson'),
  //   course(
  //       image: 'assets/images/photoshop.jpg',
  //       title: 'complet photoshop course',
  //       lessonsNumber: '29 lesson'),
  //   course(
  //       image: 'assets/images/course2.png',
  //       title: 'UI/UX COURSES',
  //       lessonsNumber: '29 lesson'),
  //   course(
  //       image: 'assets/images/course.jpg',
  //       title: 'COURSES OFFRED',
  //       lessonsNumber: '29 lesson'),
  //   course(
  //       image: 'assets/images/course2.png',
  //       title: 'UI/UX COURSES',
  //       lessonsNumber: '29 lesson'),
  //   course(
  //       image: 'assets/images/course2.png',
  //       title: 'UI/UX COURSES',
  //       lessonsNumber: '29 lesson'),
  //   course(
  //       image: 'assets/images/course.jpg',
  //       title: 'UI/UX Courses',
  //       lessonsNumber: '29 lesson'),
  //   course(
  //       image: 'assets/images/course2.png',
  //       title: 'UI/UX COURSES',
  //       lessonsNumber: '29 lesson'),
  // ];



  Future<void> getCoursees({required String category,bool isBook=false,bool popular = false}) async{
    print("entered to get courses viewModel");

    if(!isLoading && hasMore){
      isLoading = true;
      notifyListeners();
      try{
        final QuerySnapshot<Map<String, dynamic>> list  = await _service.getCourses(
            documentLimit: documentLimit, category: category,startAfter : startAfter,books:isBook,
            popular:popular);

        if(list.size<documentLimit) {
          hasMore = false;
        }
        startAfter = list.docs.last;
        for(int i=0;i<list.size;i++){
          final element = list.docs[i];
          if(isBook){
            if(books[category]==null){
              books[category] = [Book.fromJson(element.data())];
            }else{
              books[category]!.add(Book.fromJson(element.data()));
            }
          }else{
            if(courses[category]==null){
              courses[category] = [course.fromJson(element.data())];
            }else{
              courses[category]!.add(course.fromJson(element.data()));
            }
          }

        }

        notifyListeners();

      }catch (error){
        print("error in get courses $error");
        if(error.toString().contains("Bad state: No element")){
          hasMore = false;
        }
      }finally{
        isLoading = false;
        notifyListeners();
      }
    }
  }


}

