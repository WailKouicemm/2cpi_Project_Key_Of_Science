import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        flexibleSpace:
          Container( decoration: const BoxDecoration(
            image:   DecorationImage(image: AssetImage('assets/images/bar.png.png'), fit: BoxFit.fitWidth),
           )
          ),
        backgroundColor: Colors.grey[500],
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.keyboard_backspace_rounded) ,
          color:  const Color.fromRGBO(42,88,244,1)),
        titleSpacing: 120.0,
        title: const  Text('Course', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 47.0,
                left: 25.0,
                right: 25.0
              ),
              child: Container(
                height: 175.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image:  const DecorationImage(
                    image: AssetImage('assets/images/javaaa.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 7.0,
                    left: 45.0
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('dr. Nazim Ahmed' , style: TextStyle(fontWeight: FontWeight.w900, fontSize: 9.0),),
                      const SizedBox(width: 210.0,),
                      Row(
                        children:  const [
                          Icon(Icons.star_border , size: 13.8, color: Colors.blue,),
                          Text('4.5', style: TextStyle(color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),)
                        ],
                      ),
                     ],
                  ),
                ),
                const  Padding(
              padding: EdgeInsets.only(
                top: 27.0,
                left: 45.0,
              ),
              child: Text('Description:', style: TextStyle(fontSize: 17.0 , fontWeight: FontWeight.w900),),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 13.0,
                left: 45.0
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  const [
                  Text('ll basics of java and syntax, oop ( object oriented', style:TextStyle(color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.w500),),
                  Text('programming ) , exercices', style:TextStyle(color: Colors.grey, fontSize: 12.0, fontWeight: FontWeight.w500),)
                ],
              ),
            ),
                const   Padding(
              padding:   EdgeInsets.only(
                top: 38.0,
                left: 45.0
              ),
              child: Text('The Course Includes', style:TextStyle(fontSize: 17.0, fontWeight: FontWeight.w900),),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 45.0
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    minRadius: 13.0,
                    backgroundColor: Colors.deepPurple[900],
                    child:  const Icon(Icons.article_outlined, size: 20.0,color: Colors.white,),
                  ),
                  const  SizedBox(width: 4,),
                  const  Text('20 Hours Video', style: TextStyle(color: Colors.grey , fontSize: 13.0, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                left: 45.0
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    minRadius: 13.0,
                    backgroundColor: Colors.deepPurple[900],
                    child:  const Icon(Icons.insert_drive_file_outlined, size: 20.0,color: Colors.white,),
                  ),
                  const  SizedBox(width: 4,),
                  const  Text('Total 60+ Lessons', style: TextStyle(color: Colors.grey , fontSize: 13.0, fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 15.0,
                left: 45.0
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    minRadius: 13.0,
                    backgroundColor: Colors.deepPurple[900],
                    child: const  Image(image: AssetImage('assets/images/2754.png'), width: 15.0, height: 15.0,)
                  ),
                  const  SizedBox(width: 4,),
                  const  Text('20 Quiz', style: TextStyle(color: Colors.grey , fontSize: 13.0, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ],
            ),
           
             Padding(
                     padding: const EdgeInsets.only(
                       top: 65.0,
                       left: 20.0,
                       right: 20.0,
                       bottom: 20.0,
                     ),
                     child: Container(
                        decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(30.0)
                               ),
                        height: 45.0,
                        width: double.infinity,
                        child: FloatingActionButton.extended(
                             elevation: 0.0,
                             onPressed: (){}, 
                             shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)
                                ),
                             label: const  Text('Start', style: TextStyle(color: Colors.white , fontSize: 14.0, fontWeight: FontWeight.bold),),
                             backgroundColor: const  Color.fromRGBO(42,88,244,1))),
                   ),
          ],
        ),
      ),
    );
  }
}