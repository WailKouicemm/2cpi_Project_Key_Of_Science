import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';
import '../models/Models.dart';
import '../presentation/main/postsPages/view/Posts_view.dart';
import '../presentation/main/postsPages/viewModel/PostsPage_viewModel.dart';


class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({required this.post});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: AppDuration.d250),
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(horizontal: AppMargin.m4,vertical: AppMargin.m10),
        padding: const EdgeInsets.fromLTRB(AppPadding.p10,AppPadding.p10,AppPadding.p10,AppPadding.p5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r15),
          color: ColorManager.white,
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
            /// the image of the poster and his name and the date
             PosterNameAndImage(post.uid,post.date),
            const SizedBox(
              height: AppHeight.h10,
            ),
            /// the title of the post
            AutoSizeText(
              post.title,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: FontSizeManager.s17),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            /// the post text
            postContent(post.content),
            if(post.images.isNotEmpty) postImages(post.images),
            /// the icons of like and comment
            const LikeAndComment(),
          ],
        ),
      ),
    );
  }
}

class PosterNameAndImage extends StatelessWidget {
 final String uid;
 final Timestamp date;
  const PosterNameAndImage(this.uid,this.date);

  @override
  Widget build(BuildContext context) {
    final postingDate = DateFormat("yyyy MMMM dd   hh:mm a").format(DateTime(date.toDate().year,date.toDate().month,date.toDate().day,
        date.toDate().hour,date.toDate().minute));

    return FutureBuilder<String>(
      future: postsPage_modelView().getUsername(uid),
      builder: (_,snapshot)=>Row(
        children: [
          /// the user image
          const CircleAvatar(
            maxRadius: 25,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage('assets/images/man.jpg'),
          ),
          const SizedBox(
            width: AppWidth.w10,
          ),
          /// the name ad the username
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(snapshot.data ?? "-",
                style: Theme.of(context).textTheme.overline
              ),
              Text("Posted on  "+ postingDate,
                style: const TextStyle(
                    color: Colors.grey
                ),),
            ],
          ),
        ],
      ),
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
      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeightManager.light),
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
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Row(
            children: [
              const SizedBox(
                width: AppWidth.w10,
              ),
              /// comment icon
              GestureDetector(
                // ()=>setState(()=>commentField=!commentField)
                onTap: (){
                  FirebaseAuth.instance.currentUser!.uid;
                },
                child: SvgPicture.asset(
                  'assets/icons/comment.svg',
                  color: ColorManager.defaultColor,
                ),
              ),
              const SizedBox(
                width: AppWidth.w10,
              ),
              /// like icon
              GestureDetector(
                onTap: (){},
                child: const Icon(Icons.favorite_border),
              )
            ],
          ),
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
                child: TextFiledComment(),
              ),
            ],
          ),
        )
      ],
    );
  }
}


class postImages extends StatelessWidget {
  final List<String> images;
  const postImages(this.images);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/5,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m10),
      color: ColorManager.primaryColor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.r15),
        child: Row(
          children: [
            Expanded(
              child: images.length == 4 ? Column(
                children: [
                  Expanded(
                    child: _image(images[0]),

                  ),
                  Expanded(
                    child: _image(images[1]),
                  ),
                ],
              ) : _image(images[0]),
            ),
            if(images.length>1) Expanded(
                child: images.length == 4 ?  Column(
                  children: [
                    Expanded(
                      child:_image(images[2]),
                    ),
                    Expanded(
                      child: _image(images[3]),
                    )
                  ],
                ) : (
                    images.length == 3 ?  Column(
                      children: [
                        Expanded(
                          child: _image(images[1]),
                        ),
                        Expanded(
                          child: _image(images[2]),
                        )
                      ],
                    ) : _image(images[1])
                )
            )
          ],
        ),
      )
    );
  }
}


class _image extends StatelessWidget {
  final String image;
  const _image(this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      height:  double.infinity,
      width:  double.infinity,
      margin: const EdgeInsets.all(AppMargin.m1),
      child: Image.network(image,fit: BoxFit.cover,),
    );
  }
}
