import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:keyofscience/kdefault.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Lists.dart';
import 'MainScreen.dart';


class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('POSTS',
            style: TextStyle(
                color: Color(0xFF2958F5),
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    image: AssetImage('assets/images/backround_appbar.png'),
                    fit: BoxFit.cover
                )
            ),
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
    bool commentField=false;
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      controller: ScrollController(),
      itemCount: posts.length,
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context,index){
        post tmp = posts[index];
        return AnimatedSize(
        duration: const Duration(milliseconds: 250),
        child: Container(
          width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height/4,
          margin: const EdgeInsets.fromLTRB(4,10,4,10),
          padding: const EdgeInsets.fromLTRB(15,10,15,5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow:  <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// the image of the poster and his name
              Row(
                children: [
                  /// the user image
                  const CircleAvatar(
                    maxRadius: 27,
                    backgroundColor: Colors.lightBlueAccent,
                    child: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage('assets/images/man.jpg'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  /// the name ad the username
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tmp.poster_name,
                        style:const TextStyle(
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text("#"+tmp.poster_username,
                        style: const TextStyle(
                            color: Colors.grey
                        ),),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              /// the post text
              Linkify(
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                text: tmp.text_of_post,
                linkStyle: const TextStyle(color: Colors.blueAccent ),
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              /// the icons of like and comment
              StatefulBuilder(
                builder: (context,setstate){
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          /// comment icon
                          IconButton(
                            onPressed: ()=>setstate(()=>commentField=!commentField),
                            icon: const Icon(Icons.mode_comment_outlined,color: Color(0xFF2958F5)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          /// like icon
                          IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.favorite_border,color: Color(0xFF2958F5)),
                          )
                        ],
                      ),
                      if(commentField)  AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        child: Row(
                          children: const [
                            CircleAvatar(
                              maxRadius: 18,
                              backgroundColor: Colors.transparent,
                              backgroundImage: AssetImage('assets/images/man.jpg'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            /*
                  TextField(
                      key: const  ValueKey('Password876'),
                      controller:  TextEditingController(),
                      maxLines: 4,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: 'add a comment as #${tmp.poster_username}',
                        suffixIcon:  IconButton(
                          onPressed: (){},
                          icon: Image.asset("assets/images/navigation-2-outline.png",color: KdefaultColor,),
                          iconSize: 25,
                        ),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                   */
                            Expanded(
                                child: TextFiledComment()
                            ),
                          ],
                        ),
                      )

                    ],
                  );
                },
              ),
            ],
          ),
        ),
        );
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
        cursorColor: KdefaultColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          hintText: "Add comment as salah",
          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          hintStyle: const TextStyle(fontSize: 11, color: Colors.grey),
          suffixIcon: Image.asset("assets/images/navigation-2-outline.png",color: KdefaultColor,),
        ),
      ),
    );
  }
}
