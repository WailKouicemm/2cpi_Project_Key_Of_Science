import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/main/Mybooks/view/MyBooks.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';
import '../../../../services/Authenctication.dart';
import '../../../resources/Styles_Manager.dart';
import '../../Courses/view/CoursesScreen.dart';
import '../../Edit/view/Edit.dart';
import '../../main_Viewmodel.dart';
import 'package:iconsax/iconsax.dart';


class drawerScreen extends StatelessWidget {
  const drawerScreen();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.only(left: 25,top: 50),
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    ColorManager.defaultColor,
                    ColorManager.defaultColor,
                  ])),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20 , bottom: 50),
                   child: Column(
                     children: [
                       const CircleAvatar(
                        maxRadius: 53,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                            maxRadius: 50,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage('assets/images/man.jpg'),
                        ),
                ),

                       const   SizedBox(height: 15,),
                       FutureBuilder<String>(
                         future: usernameManage.getUsername(),
                         builder: (_,snapshot)=> Text('Hi , ' + (snapshot.data ?? 'HIHIHI'),
                             style: boldStyle(color: ColorManager.white,fontSize: FontSizeManager.s15,fontWeight: FontWeight.w700)
                         ),
                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(bottom: 10),
                   child: MaterialButton(
                     onPressed: (){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) =>  coursesScreen()),
                       );


                     },
                     child: Row(
                       children: const [
                         Icon(Iconsax.monitor, color: Colors.white,),
                         const SizedBox(width: 10,),
                         const Text('My courses',style: TextStyle(
                             color: Colors.white ,
                             fontSize: 15,fontFamily: FontFamilyManager.defaultFamily,
                             fontWeight: FontWeight.w400)),
                       ],
                     ),
                   ),
                 ),
                 Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Mybooks()),
                      );

                    },
                    child: Row(
                      children: [
                        Icon(Iconsax.monitor, color: Colors.white,),
                        const SizedBox(width: 10,),
                        const Text('My books',style: TextStyle(color: Colors.white , fontSize: 15,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(bottom:10),
                  child: MaterialButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  Edit()),
                      );

                    },
                    child: Row(
                      children: [
                        Icon(Iconsax.profile_circle, color: Colors.white,),
                        const SizedBox(width: 10,),
                        const Text('Edit details',style: TextStyle(color: Colors.white , fontSize: 15,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:10),
                  child: MaterialButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        Icon(Iconsax.setting, color: Colors.white,),
                        const  SizedBox(width: 10,),
                        const Text('Settings',style: TextStyle(color: Colors.white , fontSize: 15,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:10),
                  child: MaterialButton(
                    onPressed: (){},
                    child: Row(
                      children: [
                        Icon(Iconsax.information, color: Colors.white,),
                        const  SizedBox(width: 10,),
                        const Text('Help & Support',style: TextStyle(color: Colors.white , fontSize: 15,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:const  EdgeInsets.only(bottom:10),
                  child: MaterialButton(
                    onPressed: ()async {
                      await AuthService.SignOut();
                    },
                    child: Row(
                      children: [
                        Icon(Iconsax.logout, color: Colors.white,),
                        const  SizedBox(width: 10,),
                        const  Text('Log out',style: TextStyle(color: Colors.white , fontSize: 15,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          )
      ),
    );
  }
}
