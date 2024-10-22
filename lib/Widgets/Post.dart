import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_svg/flutter_svg.dart';
<<<<<<< HEAD
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';
import '../models/Models.dart';
import '../presentation/main/postsScreen/view/Posts_page.dart';
=======
import 'package:url_launcher/url_launcher.dart';

import '../models/postModel.dart';
import '../pages/Posts_page.dart';
>>>>>>> origin/main


class PostItem extends StatelessWidget {
  final post Post;
  const PostItem({required this.Post});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return AnimatedSize(
      duration: const Duration(milliseconds: AppDuration.d250),
      child: Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height/4,
=======
    bool commentField=false;
    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      child: Container(
        width: MediaQuery.of(context).size.width,
        //   height: MediaQuery.of(context).size.height/4,
>>>>>>> origin/main
        margin: const EdgeInsets.fromLTRB(4,10,4,10),
        padding: const EdgeInsets.fromLTRB(15,10,15,5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
<<<<<<< HEAD
          color: ColorManager.white,
=======
          color: Colors.white,
>>>>>>> origin/main
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
<<<<<<< HEAD
             PosterNameAndImage(Post.poster_name,Post.poster_username),
            const SizedBox(
              height: AppHeight.h10,
            ),
            /// the post text
            postContent(Post.text_of_post),
            const SizedBox(
              height: AppHeight.h10,
            ),
            /// the icons of like and comment
            const LikeAndComment(),
          ],
        ),
      ),
    );
  }
}

class PosterNameAndImage extends StatelessWidget {
 final String name;
 final String userName;
  const PosterNameAndImage(this.name, this.userName);

  @override
  Widget build(BuildContext context) {
    return   Row(
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
            Text(name,
              style:const TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            Text("#"+userName,
              style: const TextStyle(
                  color: Colors.grey
              ),),
          ],
        ),
      ],
    );
  }
}

class postContent extends StatelessWidget {
  final String text;
  final int? maxlines;
  const postContent(this.text,{this.maxlines});

  @override
  Widget build(BuildContext context) {
    return  Linkify(
      onOpen: (link) async {
        if (await canLaunch(link.url)) {
          await launch(link.url);
        } else {
          throw 'Could not launch $link';
        }
      },
      text: text,
      linkStyle: const TextStyle(color: ColorManager.LinkColor ),
      style: Theme.of(context).textTheme.bodyText1,
      maxLines: maxlines ?? 4,
      overflow: TextOverflow.ellipsis,
    ) ;
  }
}

class LikeAndComment extends StatefulWidget {
  const LikeAndComment();

  @override
  State<LikeAndComment> createState() => _LikeAndCommentState();
}

class _LikeAndCommentState extends State<LikeAndComment> {
  bool commentField=false;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            /// comment icon
            IconButton(
              onPressed: ()=>setState(()=>commentField=!commentField),
              icon: SvgPicture.asset(
                'assets/icons/comment.svg',
                color: ColorManager.defaultColor,
              ),
            ),
            const SizedBox(
              width: AppWidth.w10,
            ),
            /// like icon
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.favorite_border),
            )
          ],
        ),
        if(commentField)  AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: Row(
            children: const [
              UserImage(img: 'assets/images/man.jpg'),

              SizedBox(
                width: AppWidth.w10,
              ),
              /*
=======
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
                          icon: SvgPicture.asset(
                            'assets/icons/comment.svg',
                            color: const Color(0xFF2958F5),
                          ),
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
>>>>>>> origin/main
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
<<<<<<< HEAD
              Expanded(
                child: TextFiledComment(),
              ),
            ],
          ),
        )

      ],
    );
  }
}


=======
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
>>>>>>> origin/main
