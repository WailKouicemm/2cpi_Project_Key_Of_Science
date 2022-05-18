import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';




class Statistic extends StatefulWidget {
  const Statistic({Key? key}) : super(key: key);

  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      //  flexibleSpace: Image.asset(images.appBarImage,fit: BoxFit.fill),
        leading: IconButton(
          onPressed: ()=>Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: AppPadding.p20 , left: AppPadding.p20 , top: AppPadding.p45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Statistics' ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold , color: Colors.black),),

          ],
        ),
      ),
    );
  }
}
