import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:keyofscience/presentation/main/postsPages/view/addPost_view.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';
import 'package:keyofscience/presentation/resources/appStrings.dart';
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
          title: const Text(AppStrings.post),
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
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p5),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppPadding.p10,horizontal: AppPadding.p15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppStrings.newPosts,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontSize: FontSizeManager.s24),
              //  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: FontSizeManager.s24),
              ),
              ElevatedButton(
                  onPressed: ()=>Navigator.of(context).push(
                    MaterialPageRoute(builder: (_)=>const AddPostPage())
                  ), 
                  child: Text(AppStrings.addPost)
              ),
            ],
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: posts.length,
            itemBuilder: (context,index){
              post tmp = posts[index];
              return PostItem(Post: tmp);
            },
          ),
      ],
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