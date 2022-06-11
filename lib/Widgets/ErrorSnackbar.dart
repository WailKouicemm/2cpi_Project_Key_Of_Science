import 'package:flutter/material.dart';

SnackBar snackerror(String principle , String explanation, BuildContext context ) => SnackBar(
                padding: const EdgeInsets.all(16),
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                content: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 90.0,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 194, 194),
                        borderRadius: BorderRadius.circular(20.0)),
                      child: Row(
                        children: [
                          const SizedBox(width: 110.0,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 15.0,),
                                Row(
                                  children: [
                                    Icon(Icons.warning_amber_rounded , color:  Colors.red,),
                                    SizedBox(width: 5.0,),
                                    Text("Required !" , style: TextStyle(color: Colors.red , fontSize: 20.0, fontWeight: FontWeight.bold,), maxLines: 2, overflow: TextOverflow.ellipsis,),
                                  ],
                                ),
                                SizedBox(height: 10.0,),
                                Text("all fields are required", style: TextStyle(fontSize: 15.0 , color: Colors.red), ),
                              ],
                            ),
                          ),
                        ],
                      )
                      ),
                      Positioned(
                        bottom: -2,
                        left: -2,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20)),
                          child: Image.asset("assets/images/error.png" ,
                           height: 70, width: 70, color: Colors.red,),
                        )),
                        //  Positioned(
                        //    top: -15,
                        //    left: 17,
                        //    child: GestureDetector(
                        //      onTap: () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                        //      child: Image.asset("assets/images/closee.png" ,
                        //        height: 20, width: 20, color: Colors.red,),
                        //    ),
                        //  ),
                  ],
                )
              );
        