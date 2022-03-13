import 'package:flutter/material.dart';
import 'package:keyofscience/components.dart';

import 'package:keyofscience/kdefault.dart';
import 'package:keyofscience/pages/RECOMMENDED%20_COURSES.dart';



class PreferredCourses extends StatefulWidget {
  const PreferredCourses({ Key? key }) : super(key: key);

  @override
  _PreferredCoursesState createState() => _PreferredCoursesState();
}

class _PreferredCoursesState extends State<PreferredCourses> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: KbackgroundColor,
    appBar: appBar,
    body: Padding(
      padding: EdgeInsets.only( right: 20 , left: 20 , ),
      child: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(right :8.0 , bottom: 5 , top: 20),
                child: Text("lastly, searsh for courses" , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold , fontFamily: "Montserrat"),),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("select what do you ant to " , style: TextStyle(color: Colors.grey , fontFamily: "Montserrat"),),
                  const Text(" learn" , style: TextStyle(color: Colors.grey , fontFamily: "Montserrat"),),
                  SizedBox(height: 20,)
                ],
              ),
              GridList(ontap: (){},list: categries,)      ,

              
            ],
          ),
       Positioned(bottom: 20 , right: 0 ,child: FloatingActionButton(  onPressed: (){ Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  RECOMMANDED_COURSES()),
  );
},)),

        ],
      ),
    ),
    );
  }
}

class GridList extends StatefulWidget {
  GridList({required this.list ,required this.ontap });
  final Function() ontap;
  final List<categories> list;

  @override
  State<GridList> createState() => _GridListState();
}

class _GridListState extends State<GridList> {
  int  select = 0 ;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      semanticChildCount: 2,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 170,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20
        ),
        itemCount: widget.list.length,
     itemBuilder: (context,index)=> 
          
          Stack(
    children: [
      
      GestureDetector(
        onTap: (){
          setState(() {
            
          });
          select = index ;
        },
        child: Container(
          alignment: Alignment.center,
          child: Text(widget.list[index].title , style: TextStyle(color: Colors.white),),
                decoration: BoxDecoration(
                  color: index == select ? Kselect: KdefaultColor,
                  
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
      ),
      
    ],
          ),
          
          );
  }
}




class categories{

  categories({@required this.title = "" });
 final String  title ;
  
}




List<categories> categries = [
  categories(title: 'DESIGN UI UX'),
  categories(title: 'WEB DEVLOPMENT'),
  categories(title: 'CYBER ECURETY'),
  categories(title: 'MOBILE DEVLOPMENT'),
  categories(title: 'GRAPHICMOYION'),
  categories(title: 'AI & MACHINE LEARNING'),
  categories(title: 'AI & MACHINE LEARNING'),
];