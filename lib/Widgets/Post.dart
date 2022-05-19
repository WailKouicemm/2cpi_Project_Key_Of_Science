import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:keyofscience/commun/photoView.dart';
import 'package:keyofscience/presentation/main/postsPages/viewModel/PostsPage_viewModel.dart';
import 'package:keyofscience/presentation/main/postsPages/viewModel/comments_viewModel.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:keyofscience/services/post_services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components.dart';
import '../models/Models.dart';
import '../presentation/main/postsPages/view/Posts_view.dart';
import '../presentation/main/postsPages/view/comments_view.dart';


class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({required this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
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
          PosterNameAndImage(post.userr,post.date),
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
          LikeAndComment(post.id,post.isLiked,post.nbLikes),
        ],
      ),
    );
  }
}

class PosterNameAndImage extends StatelessWidget {
 final user userr;
 final Timestamp date;
  const PosterNameAndImage(this.userr,this.date);

  @override
  Widget build(BuildContext context) {
    final postingDate = DateFormat("yyyy MMMM dd   hh:mm a").format(DateTime(date.toDate().year,date.toDate().month,date.toDate().day,
        date.toDate().hour,date.toDate().minute));

    return Row(
      children: [
        /// the user image
          CircleAvatar(
          maxRadius: 25,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(userr.image.isEmpty ? 'assets/images/man.jpg': userr.image),
        ),
        const SizedBox(
          width: AppWidth.w10,
        ),
        /// the name ad the username
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(userr.username,
                style: Theme.of(context).textTheme.overline
            ),
            Text("Posted on  "+ postingDate,
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
      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeightManager.light),
      maxLines: maxlines ?? 4,
      overflow: TextOverflow.ellipsis,
    ) ;
  }
}

class LikeAndComment extends StatefulWidget {
  final String postId;
  final bool isLiked;
  int nbLikes;
    LikeAndComment(this.postId,this.isLiked,this.nbLikes);

  @override
  State<LikeAndComment> createState() => _LikeAndCommentState();
}

class _LikeAndCommentState extends State<LikeAndComment> {
 late bool isliked;
  @override
  void initState() {
      isliked = widget.isLiked;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: StatefulBuilder(
              builder: (_,setstate)=>   Row(
                children: [
                  const SizedBox(
                    width: AppWidth.w10,
                  ),
                  /// comment icon
                  GestureDetector(
                        // ()=>setState(()=>commentField=!commentField)
                        onTap: (){
                          comments_view(context,widget.postId,isliked);
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
                  Row(
                    children: [
                      GestureDetector(
                        onTap: ()async{
                          widget.nbLikes++;
                          setstate(() {isliked=!isliked;});
                          await postsPage_modelView.likePost(widget.postId);
                          // await postSevices.like(postId: widget.postId);
                        },
                        child: isliked? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
                      ),
                      const SizedBox(
                        width: AppWidth.w10,
                      ),
                      Text("${widget.nbLikes}")
                    ],
                  )
                ],
              ),
          ),
        ),
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
      height: MediaQuery.of(context).size.height*1.8/5,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m10),
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(AppRadius.r15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppRadius.r15),
        child: Row(
          children: [
            Expanded(
              child: images.length == 4 ? Column(
                children: [
                  Expanded(
                    child: _image(0, images),

                  ),
                  Expanded(
                    child: _image(1,images),
                  ),
                ],
              ) : _image(0,images),
            ),
            if(images.length>1) Expanded(
                child: images.length == 4 ?  Column(
                  children: [
                    Expanded(
                      child:_image(2,images),
                    ),
                    Expanded(
                      child: _image(3,images),
                    )
                  ],
                ) : (
                    images.length == 3 ?  Column(
                      children: [
                        Expanded(
                          child: _image(1,images),
                        ),
                        Expanded(
                          child: _image(2,images),
                        )
                      ],
                    ) : _image(1,images)
                )
            )
          ],
        ),
      )
    );
  }
}


class _image extends StatelessWidget {
  final int index;
  final List<String> imagesList;
  const _image(this.index,this.imagesList);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_)=>ImagePage(imagesList: imagesList,currentpage: index,))
          );
        },
        child: Hero(
          tag: imagesList[index],
          child: Container(
            height:  double.infinity,
            width:  double.infinity,
            margin: const EdgeInsets.all(AppMargin.m1),
            child: Image.network(imagesList[index],fit: BoxFit.cover,),
          ),
        )
      );
  }
}


