// ignore_for_file: file_names


import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../presentation/resources/ColorManager.dart';
import '../presentation/resources/Styles_Manager.dart';

/// this viewer in only for File
class networPdfViewer extends StatelessWidget {
  final String title;
  final String link;
  networPdfViewer({required this.title, required this.link,});


  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getThemeData().copyWith(
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: ColorManager.defaultColor,
          ),
          titleTextStyle: semiBoldStyle(
            color: ColorManager.black,
          ),
          centerTitle: false,
        ),
      ),
      home: Scaffold(
          appBar: AppBar(
            flexibleSpace: Image.asset(images.appBarImage,fit: BoxFit.fill),
            leading: IconButton(
              onPressed: ()=>Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),),
            title: Text(title,),
          ),
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SfPdfViewer.network(
           'http://www.africau.edu/images/default/sample.pdf')
        ),
      ),
    );
  }
}


