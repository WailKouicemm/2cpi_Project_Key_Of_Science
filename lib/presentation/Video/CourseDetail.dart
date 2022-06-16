import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';
import 'package:keyofscience/services/course_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Player.dart';

class CourseDetail extends StatefulWidget {
  final String courseId;
  const CourseDetail({Key? key,required this.courseId}) : super(key: key);

  @override
  _CourseDetailState createState() => _CourseDetailState();
}
class _CourseDetailState extends State<CourseDetail> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(

          title: Text('Course content'),
        ),
        body:     FutureBuilder<List<String>>(
            future: course_service.getCourseMap(widget.courseId),
            builder: (context,snapshot)=> Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20 , right: 15 , left: 15 , bottom: 20),
                  child: Stack(
                    children: [
                      Container(
                        height: 18,
                        width: width,
                        decoration: BoxDecoration(
                            //color: Colors.grey.shade300,
                            color: ColorManager.textFieldColor,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      Container(
                        height: 18,
                        width: !snapshot.hasData? 0 : width * (snapshot.data!.length)/15,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),

                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (BuildContext context,int index){
                        index++;
                        return
                          GestureDetector(
                            onTap: ()async{

                              await course_service.setVideo_toReaded(widget.courseId, index.toString());

                              setState(() {
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const Player()),
                              );

                            },
                            child: Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.deepPurple,
                                  radius: 12,
                                  child: Icon(CupertinoIcons.camera,size: 12,),
                                ),
                                trailing: SizedBox(
                                  width: 15,
                                  height: 15,
                                  child: snapshot.hasData?
                                  ( snapshot.data!.contains(index.toString()) ? Icon(Icons.done,color: Colors.green,) : Center()) :
                                  CircularProgressIndicator(),
                                ),
                                title:Text("video  $index",style: TextStyle(fontFamily: "Montserrat" , color: Colors.black),),

                              ),
                            ),
                          );
                      }
                  ),

                )
              ],
            )
        ),

    );
}

}


