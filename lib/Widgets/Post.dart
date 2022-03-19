import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/postModel.dart';
import '../pages/Posts_page.dart';


class PostItem extends StatelessWidget {
  final post Post;
  const PostItem({required this.Post});

  @override
  Widget build(BuildContext context) {
    bool commentField=false;
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
                    Text(Post.poster_name,
                      style:const TextStyle(
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("#"+Post.poster_username,
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
              text: Post.text_of_post,
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
                              child:  TextFiledComment(),
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
  }
}
