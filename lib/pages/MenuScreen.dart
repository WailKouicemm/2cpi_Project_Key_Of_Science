import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen();
  @override
  Widget build(BuildContext context) {
    print("MenuScreen called");
    const String name='Salah Eddine Salhi';
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
                const CircleAvatar(
                  maxRadius: 41,
                  backgroundColor: Colors.lightBlueAccent,
                  child: CircleAvatar(
                      maxRadius: 38,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/man.jpg'),
                  ),
                ),
                const SizedBox(height: 15,),
                const Text(name,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white
                  ),
                ),
                const Divider(color: Colors.white60,height: 30,),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text('Home Screen'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 15),
                  child: Text('Your Wish Liste'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical:15),
                  child: Text('Your card'),
                ),
                const Spacer(),
                const Divider(color: Colors.white60,height: 30,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: OutlineButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset('assets/images/logout.png',scale: 25,color: Colors.white,),
                        const  SizedBox(width: 5,),
                        const  Text('Logout '),
                      ],
                    ),
                    textColor: Colors.white,
                    highlightColor: Colors.white,
                    borderSide: const  BorderSide(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
      ),
    );
  }
}
