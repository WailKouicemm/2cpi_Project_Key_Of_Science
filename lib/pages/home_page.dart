// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({ Key? key }) : super(key: key);
//
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//      double height = MediaQuery.of(context).size.height;
//       const Color KdefaultCOlor= Color(0xFF2958F5);
//       Widget Title_Text({required String txt,required bool seAll})=>Padding(
//          padding:const EdgeInsets.all(10),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//            children: [
//               Text(txt,
//                style: const TextStyle(
//                    fontSize: 20,
//                    fontWeight: FontWeight.bold
//                ),),
//              if(seAll)
//              TextButton(
//                onPressed: (){},
//                child: const Text('SEE ALL',
//                  style: TextStyle(
//                    fontSize: 12,
//                    color: KdefaultCOlor,
//                  ),
//                ),
//              ),
//            ],
//          )
//      );
//     return Scaffold(
//       appBar: AppBar(
//         leading: Image.asset('images/options-2-outline.png',color: KdefaultCOlor,),
//         title: const Text('KEYEINCE',
//           style: TextStyle(
//               color: Color(0xFF2958F5)
//           ),
//         ),
//         centerTitle: true,
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//               color: Colors.green,
//               image: DecorationImage(
//                   image: AssetImage('images/backround_appbar.png'),
//                   fit: BoxFit.cover
//               )
//           ),
//         ),
//       ),
//        body: SingleChildScrollView(
//            child: Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: [
//                profilecard(height: height),
//                Title_Text(txt:'   Keyeince features',seAll: false),
//                const Keyeince_features(),
//                Title_Text(txt:'   Courses for you',seAll: true),
//                CorsesListView(coursess: populaCorses,),
//                Title_Text(txt:'   Recently posts',seAll: true),
//                const Recentrly_posts(),
//              ],
//            ),
//          )
//     );
//   }
// }
//
// class profilecard extends StatelessWidget {
//   const profilecard({
//     Key? key,
//     required this.height,
//   }) : super(key: key);
//
//   final double height;
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       padding: const EdgeInsets.only(left: 25 , top: 25 , bottom: 25,right: 25),
//       margin: const EdgeInsets.only(top:10),
//       height: height * 0.2,
//       width: double.infinity,
//       decoration: const BoxDecoration(
//          image:  DecorationImage(
//           image: AssetImage('images/CARD.png'),
//            fit: BoxFit.fill
//         ),
//       ),
//       child: Row(
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children:  const [
//               Text('Hi , Mohamed' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
//               SizedBox(height: 15,),
//               Text('Your reacently coursz : JAVA BASICS' , style: TextStyle(color: Colors.white , ),),
//               SizedBox(height: 15,),
//               Text('Next lesson : Monday,18 at 13:00' , style: TextStyle(color: Colors.white , ),)
//
//             ],
//           ),
//           const Spacer(),
//             Container(
//               decoration: const BoxDecoration(
//                 boxShadow: <BoxShadow>[
//                   BoxShadow(
//                       color: Colors.white,
//                       blurRadius: 70.0,
//                       offset: Offset(0.0, 0.75)
//                   )
//                 ],
//               ),
//             child: const CircleAvatar(
//               backgroundColor: Colors.white,
//               maxRadius: 30,
//               child: Center(
//                 child: Text('50%',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold
//                 ),),
//               ),
//             )
//           )
//         ],
//       )
//     );
//   }
// }
//
// class Keyeince_features_item{
//   final String name;
//   final IconData logo;
//   const Keyeince_features_item({required this.name,required this.logo});
// }
//
// class Keyeince_features extends StatelessWidget {
//   const Keyeince_features({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     const List<Keyeince_features_item> Keyeince_features_items = [
//       Keyeince_features_item(name: "Add\nnote", logo: Icons.note_add_outlined),
//       Keyeince_features_item(name: "Study\nresult", logo: Icons.query_stats),
//       Keyeince_features_item(name: 'Add\npost', logo: Icons.add ),
//     ];
//     return Row(
//        children:  Keyeince_features_items.map((tmp) => Expanded(
//          child: Container(
//            height: 60,
//             margin: const EdgeInsets.symmetric(horizontal: 10),
//            decoration:  BoxDecoration(
//              borderRadius: BorderRadius.circular(15),
//                  image:const DecorationImage(
//                    image: AssetImage('images/CARD.png'),
//                    fit: BoxFit.cover,
//                 )
//            ),
//            child: Row(
//              mainAxisAlignment: MainAxisAlignment.spaceAround,
//              children: [
//                Text(tmp.name,
//                style: const TextStyle(
//                  color: Colors.white,
//                  fontSize: 15,
//                  fontWeight: FontWeight.w500
//                ),),
//                Icon(tmp.logo,
//                color: Colors.white,),
//              ],
//            ),
//          )
//        )).toList(),
//     );
//   }
// }
//
//
//
//
// class courses{
//   final String path ,title , coursesnum;
//
//  const courses({@required this.title = "" ,@required this.path = ""  ,@required this.coursesnum = ""});
//
// }
//
// List<courses> populaCorses = const [
//   courses(path: 'images/backround_appbar.png' , title: 'introduction to Java' , coursesnum: '29'),
//   courses(path: 'images/backround_appbar.png' , title: 'UI/UX COURSES' , coursesnum: '29'),
//   courses(path: 'images/backround_appbar.png' , title: 'COURSES OFFRED' , coursesnum: '29'),
//   courses(path: 'images/backround_appbar.png' , title: 'UI/UX COURSES' , coursesnum: '29'),
//   courses(path: 'images/backround_appbar.png' , title: 'UI/UX COURSES' , coursesnum: '29'),
//   courses(path: 'images/backround_appbar.png' , title: 'UI/UX Courses' , coursesnum: '29'),
//   courses(path: 'images/backround_appbar.png' , title: 'UI/UX COURSES' , coursesnum: '29'),
// ];
//
// List<courses> webdevloppment =const [
//   courses(path: 'images/backround_appbar.png' , title: 'Full stack', coursesnum: '29'),
//   courses(path: 'images/backround_appbar.png' , title: 'Frontend Course',coursesnum: '29'),
//   courses(path: 'images/backround_appbar.png' , title: 'UI/UX COURSES',coursesnum: '29'),
//   courses(path: 'images/backround_appbar.png' , title: 'UI/UX COURSES',coursesnum: '29'),
//   courses(path: 'images/backround_appbar.png' , title: 'UI/UX Courses',coursesnum: '29'),
//   courses(path: 'images/backround_appbar.png' , title: 'UI/UX COURSES',coursesnum: '29'),
//
// ];
//
//
//
//
//
// class CorsesListView extends StatelessWidget {
//   CorsesListView({required this.coursess , });
//   final List<courses> coursess;
//
//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double widh = MediaQuery.of(context).size.width;
//     return SizedBox(
//       height: height * 0.2,
//       width: double.infinity,
//       child: ListView.builder(
//         itemCount: coursess.length,
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         itemBuilder :  (context , index){
//           if (kDebugMode) {
//             print("$index");
//           }
//           return GestureDetector(
//             onTap: (){},
//             child: Stack(
//               children: [
//                 Container(
//                   width: widh * 0.8,
//                   margin: const EdgeInsets.only(right: 10),
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     image: const DecorationImage(image: AssetImage("images/java.jpg"),fit: BoxFit.cover),
//                     borderRadius:BorderRadius.circular(15),
//                   ),
//                 ),
//                 Container(
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10 , bottom: 10),
//                     child: SizedBox(
//                       width: widh * 0.25,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(coursess[index].title , style: const TextStyle(color: Colors.white),),
//                           Text(coursess[index].coursesnum , style: const TextStyle(color: Colors.grey , fontSize: 10),),
//                           InkWell(
//                             onTap: (){},
//                             child: Container(
//                                 padding: const EdgeInsets.all(2),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(10),
//                                   color: Colors.pink,
//                                 ),
//                                 child:const Text(' continue ' , style: TextStyle(color: Colors.white),)
//                             ),
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                   width: widh * 0.8,
//                   margin:  const EdgeInsets.only(right: 10),
//                   alignment: Alignment.bottomLeft,
//                   decoration: BoxDecoration(
//                       borderRadius:BorderRadius.circular(15),
//                       color: Colors.black.withOpacity(0.4)
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       ),
//     );
//   }
// }
//
// class post{
//   final String poster_image;
//   final String poster_name;
//   final String poster_username;
//   final String text_of_post;
//
//   const post({required this.poster_image,required this.poster_name,
//     required this.poster_username,required this.text_of_post});
// }
// class Recentrly_posts extends StatelessWidget {
//     const  Recentrly_posts({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     const List<post> posts=[
//       post(poster_image: "images/man.jpg",
//           poster_name: 'Ahmed Djaalab',
//           poster_username: "01M02",
//           text_of_post: "Hello , i have a question about why we use getters and setters in Java"
//       ),
//       post(poster_image: "images/man.jpg",
//           poster_name: 'Ahmed Djaalab',
//           poster_username: "01M02",
//           text_of_post: "Hello , i have a question about why we use getters and setters in Java"
//       ),
//     ];
//     double height = MediaQuery.of(context).size.height;
//     double widh = MediaQuery.of(context).size.width;
//     return SizedBox(
//       height: height * 0.2,
//       width: double.infinity,
//       child: ListView.builder(
//         itemCount: posts.length,
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         itemBuilder :  (context , index)=>Container(
//           width: widh * 0.8,
//           margin: const EdgeInsets.symmetric(horizontal: 10),
//           padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(15),
//             color: Colors.white,
//             boxShadow:  <BoxShadow>[
//               BoxShadow(
//                 color: Colors.grey.withOpacity(0.1),
//                 spreadRadius: 5,
//                 blurRadius: 7,
//                 offset: const Offset(0, 3),
//               ),
//             ],
//           ),
//           child: Column(
//
//             children: [
//               Row(
//                 children: [
//                   /// the user image
//                   CircleAvatar(
//                     maxRadius: 25,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image: AssetImage(posts[index].poster_image),
//                           fit: BoxFit.cover,
//                         )
//                       ),
//                     )
//                   ),
//                  const SizedBox(
//                     width: 10,
//                   ),
//                   /// the name ad the username
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(posts[index].poster_name,
//                       style:const TextStyle(
//                         fontWeight: FontWeight.bold
//                       ),
//                       ),
//                       Text("#"+posts[index].poster_username,
//                           style: const TextStyle(
//                           color: Colors.grey
//                       ),),
//                     ],
//                   ),
//                 ],
//               ),
//               Expanded(
//                 child: Center(
//                   child: Text(
//                     posts[index].text_of_post,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                       fontSize: 15
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
