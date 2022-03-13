import 'package:flutter/material.dart';
import 'kdefault.dart';

class LoginButton extends StatelessWidget {
LoginButton(
  {required this.text , required this.onpressed , this.textColor = Colors.white, this.backgroundCOlor = Colors.blue}
);
  final String text ;
  final Function() onpressed ;
  final Color textColor , backgroundCOlor;
  

  @override
  Widget build(BuildContext context) {
    return Padding(      
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: new MaterialButton(
        
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 5.0,
        minWidth: 400.0,
        
        height: 45,
        color: backgroundCOlor,
        child: new Text(text,
            style: new TextStyle(fontSize: 16.0, color: textColor , fontFamily: "Montserrat"),),
        onPressed: onpressed
      ),
    );

  }
}



class TextFormFiledC extends StatefulWidget {
    TextFormFiledC(
      {
          this.colour = Colors.blue,
        @required this.text = "",
        this.obscured = false ,
        this.icon = const Icon(Icons.person , color: Colors.blue,),
        this.suffixicon =false,
        this.padding =30,
      }
      
    );

    final Color colour ;
    final String text ;
    final Icon icon ;
     bool obscured ;
    final bool suffixicon ;
    double padding = 30;

  @override
  State<TextFormFiledC> createState() => _TextFormFiledCState();
}

class _TextFormFiledCState extends State<TextFormFiledC> {
    bool visibal = true ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: widget.padding ),
      child: TextFormField(
        autofocus: false,
        obscureText: widget.obscured,
        cursorColor: KdefaultColor,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          
            hintText: widget.text,
            contentPadding: EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
            hintStyle: TextStyle( fontSize: 11 , color: Colors.grey),
            prefixIcon: widget.icon,
            suffixIcon: widget.suffixicon ? IconButton(onPressed: (){ setState(() {
              widget.obscured ? widget.obscured = false : widget.obscured = true ;
              
            }); }, icon:Icon(widget.obscured ? Icons.visibility  : Icons.visibility_off) ):Icon(null)  ,
          ),

          
          
      ),
    );
  }
}





class courses{

  courses({@required this.title = "" ,@required this.path = ""  ,@required this.coursesnum = ""});
 final String path ,title , coursesnum;
  
}

List<courses> populaCorses = [
  courses(path: 'assets/images/photoshop.jpg' , title: 'complet photoshop course' , coursesnum: '29 lesson'),
  courses(path: 'assets/images/illustrator.jpeg' , title: 'Illustrator CC Full Course' , coursesnum: '29 lesson'),
  courses(path: 'assets/images/ae.jpg' , title: 'intoduction to ui utilization of after Effects' , coursesnum: '29 lesson'),

  courses(path: 'assets/images/java.jpg' , title: 'introduction to Java' , coursesnum: '29 lesson'),
  courses(path: 'assets/images/course2.png' , title: 'UI/UX COURSES' , coursesnum: '29 lesson'),
  courses(path: 'assets/images/course.jpg' , title: 'COURSES OFFRED' , coursesnum: '29 lesson'),
  courses(path: 'assets/images/course2.png' , title: 'UI/UX COURSES' , coursesnum: '29 lesson'),
  courses(path: 'assets/images/course2.png' , title: 'UI/UX COURSES' , coursesnum: '29 lesson'),
  courses(path: 'assets/images/course.jpg' , title: 'UI/UX Courses' , coursesnum: '29 lesson'),
  courses(path: 'assets/images/course2.png' , title: 'UI/UX COURSES' , coursesnum: '29 lesson'),
  
  
];

List<courses> webdevloppment = [
  courses(path: 'assets/images/web1.png' , title: 'Full stack', coursesnum: '29'),
  courses(path: 'assets/images/web2.jpeg' , title: 'Frontend Course',coursesnum: '29'),
  courses(path: 'assets/images/web3.jpeg' , title: 'UI/UX COURSES',coursesnum: '29'),
  courses(path: 'assets/images/course2.png' , title: 'UI/UX COURSES',coursesnum: '29'),
  courses(path: 'assets/images/course.jpg' , title: 'UI/UX Courses',coursesnum: '29'),
  courses(path: 'assets/images/course2.png' , title: 'UI/UX COURSES',coursesnum: '29'),
  
];





class CorsesListView extends StatelessWidget {
  CorsesListView({required this.coursess ,required this.ontap });
    final List<courses> coursess;
    final Function() ontap;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: coursess.length,
      scrollDirection: Axis.vertical,
      itemBuilder :  (context , index)=>
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             GestureDetector(
     onTap: ontap,
     child: Stack(
     
     children: [
       
       Container(
             width: widh * 0.9,
             height: 175,
             alignment: Alignment.center,
        decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(coursess[index].path),fit: BoxFit.cover),
              borderRadius:BorderRadius.circular(15),
        ),
       ),





       Container(
             child: Padding(
               padding: const EdgeInsets.only(left: 10 , bottom: 10),
               child: SizedBox(
                 width: widh * 0.25,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.end,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text(coursess[index].title , style: TextStyle(color: Colors.white , fontFamily: "Montserrat" ),),
                     Text(coursess[index].coursesnum , style: TextStyle(color: Colors.grey , fontSize: 10 , fontFamily: "Montserrat"),),
                     Container(child: Text('continue' , style: TextStyle(color: Colors.white  ,fontWeight: FontWeight.bold , fontFamily: "Montserrat" ),) , decoration: BoxDecoration(borderRadius: BorderRadius.circular(20) , color: Color(0xFFCC40B2)), padding: EdgeInsets.symmetric(horizontal: 8 , vertical: 2),)
                   ],
                 ),
               ),
             ),
             width: widh * 0.9,
             height: 175,
             margin: EdgeInsets.only(bottom: 20),
             alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.7)
        ),
       ),






     ],
     ),
             ),
           ],
         )
      ,
    );
  }
}


AppBar appBar = AppBar(
        flexibleSpace: Container(
          
          decoration: BoxDecoration(
            
            image: DecorationImage(image: AssetImage("assets/images/backround.png") , fit: BoxFit.cover)
          ),
        ),
        title: logo,
        backgroundColor: Colors.white,
        actions: [
          
          CircleAvatar(
            backgroundColor: KdefaultColor,
            maxRadius: 3,
          ),
          SizedBox(width: 3,),
          CircleAvatar(
            backgroundColor: KdefaultColor,
            maxRadius: 3,
           child: CircleAvatar(backgroundColor: Colors.white, maxRadius: 2,),
          ),
          SizedBox(width: 3,),
          CircleAvatar(
            backgroundColor: KdefaultColor,
            maxRadius: 3,
            child: CircleAvatar(backgroundColor: Colors.white, maxRadius: 2,),
          ),
          SizedBox(width: 10,),
        ],
      );