import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';

import '../../../../Widgets/Post.dart';
import '../../../../models/Models.dart';
import '../../../resources/ColorManager.dart';


class PostsPage extends StatelessWidget {
  const PostsPage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(images.appBarImage),
                    fit: BoxFit.cover
                )
            ),
          ),
          leading: IconButton(
            onPressed: ()=>Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: const Posts_Body(),
      ),
    );
  }
}

 


class Posts_Body extends StatefulWidget {
  const Posts_Body();

  @override
  State<Posts_Body> createState() => _Posts_BodyState();
}

class _Posts_BodyState extends State<Posts_Body> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      controller: ScrollController(),
      itemCount: posts.length,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
      itemBuilder: (context,index){
        post tmp = posts[index];
        return PostItem(Post: tmp);
      },
    );
  }
}

class TextFiledComment extends StatelessWidget {
  const TextFiledComment();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
        autofocus: false,
        cursorColor: ColorManager.defaultColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          hintText: "Add comment as salah",
          contentPadding: const EdgeInsets.only(
              left: AppPadding.p14,
              bottom: AppPadding.p8,
              top: AppPadding.p8),
          hintStyle: const TextStyle(fontSize: FontSizeManager.s11, color: Colors.grey),
          suffixIcon: Image.asset(images.send,color: ColorManager.defaultColor,),
        ),
      ),
    );
  }
}







const List<post> posts=[
  post(poster_image: "assets/images/man.jpg",
      poster_name: 'Salah Eddine Salhi',
      poster_username: "sa16",
      text_of_post: "Hello , i have a question about why we use getters and setters in Java"
          "Hello , i have a question about why we use getters and setters in www.google.com "
          "Hello , i have a question about why we use getters and setters in www.google.com "
          "Hello , i have a question about why we use getters and setters in www.google.com "
          "Hello , i have a question about why we use getters and setters in www.google.com "
          ""
          "Hello , i have a question about why we use getters and setters in Java"
  ),
  post(poster_image: "assets/images/man.jpg",
      poster_name: 'Walid kacemi',
      poster_username: "wa8",
      text_of_post: "Hello , i have a question about why we use getters and setters in Java"
  ),
  post(poster_image: "assets/images/man.jpg",
      poster_name: 'Salah Eddine Salhi',
      poster_username: "sa16",
      text_of_post: "Hello , i have a question about why we use stateless and statefull widgets in flutter"
  ),
  post(poster_image: "assets/images/man.jpg",
      poster_name: 'Walid kacemi',
      poster_username: "wa8",
      text_of_post: "Hello , i have a question about why we use getters and setters in Java"
  ),
  post(poster_image: "assets/images/man.jpg",
      poster_name: 'Salah Eddine Salhi',
      poster_username: "sa16",
      text_of_post: "Hello , i have a question about why we use stateless and statefull widgets in flutter"
  ),
  post(poster_image: "assets/images/man.jpg",
      poster_name: 'Walid kacemi',
      poster_username: "wa8",
      text_of_post: "Hello , i have a question about why we use getters and setters in Java"
          "Hello , i have a question about why we use getters and setters in Java"
          "Hello , i have a question about why we use getters and setters in Java"
  ),
];