import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:keyofscience/kdefault.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';

import '../../Widgets/Post.dart';
import '../../models/Models.dart';
import '../resources/ColorManager.dart';
import '../../pages/Posts_Lists.dart';


class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('POSTS'),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/backround_appbar.png'),
                    fit: BoxFit.cover
                )
            ),
          ),
          leading: IconButton(
            onPressed: ()=>Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: const Body_posts(),
      ),
    );
  }
}

 


class Body_posts extends StatefulWidget {
  const Body_posts();

  @override
  State<Body_posts> createState() => _Body_postsState();
}

class _Body_postsState extends State<Body_posts> {
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
          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          hintStyle: const TextStyle(fontSize: 11, color: Colors.grey),
          suffixIcon: Image.asset("assets/images/navigation-2-outline.png",color: ColorManager.defaultColor,),
        ),
      ),
    );
  }
}


