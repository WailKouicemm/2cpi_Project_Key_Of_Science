import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:keyofscience/Widgets/shimmerObject.dart';
import 'package:keyofscience/presentation/main/postsPages/viewModel/PostsPage_viewModel.dart';
import 'package:keyofscience/models/Models.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:keyofscience/services/comments_services.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:tuple/tuple.dart';

import '../../../../components.dart';
import '../../../resources/ColorManager.dart';
import '../../../resources/FontsManager.dart';
import '../../../resources/appStrings.dart';
import '../viewModel/comments_viewModel.dart';

// class commentpagepage extends StatefulWidget {
//   const commentpagepage({Key? key}) : super(key: key);
//
//   @override
//   _commentpagepageState createState() => _commentpagepageState();
// }
//
// class _commentpagepageState extends State<commentpagepage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: MultiProvider(
//           providers: [
//             ChangeNotifierProvider<comments_viewModel>(
//                 create: (_) => comments_viewModel())
//           ],
//           child: Builder(
//             builder: (_)=>Container(
//                 padding: const EdgeInsets.only(
//                     top: AppPadding.p40,
//                     left: AppPadding.p20,
//                     right: AppPadding.p20
//                 ),
//                 alignment: Alignment.topCenter,
//                 decoration: const BoxDecoration(
//                   color: ColorManager.white,
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
//                 ),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Expanded(
//                         child: comments_list()
//                     ),
//                     const addCommentTextField(),
//                     const SizedBox(
//                       height: AppHeight.h10,
//                     )
//                   ],
//                 )
//             ),
//           ),
//         )
//
//     );
//   }
// }

comments_view(BuildContext context,String postId,bool isLiked) {
  /*
      return showFlexibleBottomSheet(
    minHeight: 0,
    initHeight: 1,
    maxHeight: 1,
    context: context,
    useRootNavigator:true,
    bottomSheetColor: Colors.transparent,
    isCollapsible: true,
    builder: (BuildContext context, ScrollController scrollController, double bottomSheetOffset) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<comments_viewModel>(
              create: (_) => comments_viewModel())
        ],
        child: _buildBottomSheet(context, scrollController, bottomSheetOffset),
      );},
    isExpand: true,
  );
     */
  return showMaterialModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))
    ),
    context: context,
    builder: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider<comments_viewModel>(create: (_) => comments_viewModel())
      ],
      child: _buildBottomSheet(context,postId,isLiked),
    ),
  );
}

class _buildBottomSheet extends StatelessWidget {
  final BuildContext context;
  final String postId;
   bool isLiked;

  _buildBottomSheet(this.context,this.postId,this.isLiked);



  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (_) => Container(
          padding: const EdgeInsets.only(top: AppPadding.p40, left: AppPadding.p20, right: AppPadding.p20),
          alignment: Alignment.topCenter,
          decoration: const BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "78 person Like that",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    IconButton(
                      onPressed: ()=>Navigator.pop(context),
                      icon: const Icon(Icons.close,color: ColorManager.grey1,size: 23,),
                    ),
                  ],
                ),
                const Divider(
                  color: ColorManager.grey1,
                ),
                Expanded(
                  child: comments_list(ModalScrollController.of(context) ?? ScrollController(),postId),
                ),
                addCommentTextField(postId),
              ],
            ),
          )
      ),
    );
  }
}

class comments_list extends StatefulWidget {
  ScrollController scrollController;
  String postId;

  comments_list(this.scrollController,this.postId);

  @override
  _comments_listState createState() => _comments_listState();
}

class _comments_listState extends State<comments_list> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = widget.scrollController;
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Provider.of<comments_viewModel>(context,listen: false).getComments(widget.postId);
    });
    _scrollController = _scrollController..addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if ((_scrollController.position.pixels + 250) >=
        _scrollController.position.maxScrollExtent) {
      SchedulerBinding.instance!.addPostFrameCallback((_) {
        Provider.of<comments_viewModel>(context,listen: false).getComments(widget.postId);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Selector<comments_viewModel,Tuple2<List<comment>,bool>>(
      selector: (_,provider)=>Tuple2(provider.comments, provider.isLoading),
      builder: (_,data,__)=>ListView.builder(
        shrinkWrap: true,
        itemCount: data.item1.length+5,
        itemBuilder: (context,index){
          if(index >= data.item1.length){
            if(data.item2) {
              return const  shimmerComment();
            }else if(index > data.item1.length){
              return const Center();
            }
            return const Center(
                child: Padding(
                  padding: EdgeInsets.all(AppPadding.p20),
                  child: Text(
                      "no more comments",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: FontSizeManager.s10,
                      )
                  ),
                )
            );
          }
          comment tmp = data.item1[index];
           return  _singleComment(tmp,widget.postId);
        },
      ),
    );

  }
}

class _singleComment extends StatelessWidget {
  final comment coment;
  final String postId;
  const _singleComment(this.coment,this.postId);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             UserImage(img: coment.userr.image),
            Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: ColorManager.primaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.all(AppPadding.p7),
                        margin: const EdgeInsets.all(AppMargin.m5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(coment.userr.username,
                                style: Theme.of(context).textTheme.overline
                            ),
                            const SizedBox(
                              height: AppHeight.h5,
                            ),
                            ReadMoreText(
                                coment.content,
                                trimLines: 3,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontWeight: FontWeightManager.light),
                                colorClickableText: ColorManager.grey,
                                trimMode: TrimMode.Line,
                                trimCollapsedText: AppStrings.showMore,
                                trimExpandedText: AppStrings.showLess,
                                moreStyle:
                                    Theme.of(context).textTheme.bodyText1),
                          ],
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: AppPadding.p5,
                            horizontal: AppPadding.p10),
                        child: likeButton(commentId: coment.id,postId: postId, isLike: coment.isLiked,)
                        )
                  ],
                )),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}

class addCommentTextField extends StatefulWidget {
  final String postId;
  const addCommentTextField(this.postId);

  @override
  _addCommentTextFieldState createState() => _addCommentTextFieldState();
}

class _addCommentTextFieldState extends State<addCommentTextField> {
  late TextEditingController _textcontroller;

  @override
  void initState() {
    _textcontroller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppPadding.p15),
      child: TextField(
        key: const ValueKey('Password876'),
        controller: _textcontroller,
        style: const TextStyle(color: Colors.black),
        maxLines: 4,
        minLines: 1,
        decoration: InputDecoration(
          hintText: 'write a comment... ',
          suffixIcon: IconButton(
            disabledColor: Colors.red,
            onPressed: () {
              final String content = _textcontroller.text.trim();
              _textcontroller.clear();
              if (content.isNotEmpty) {
                Provider.of<comments_viewModel>(context, listen: false).addComment(content: content,postId: widget.postId);
              }
            },
            icon: Image.asset(
              "assets/images/navigation-2-outline.png",
              color: ColorManager.defaultColor,
            ),
            iconSize: 25,
          ),
        ),
        onSubmitted: (content) {
          _textcontroller.clear();
          if (content.isNotEmpty) {
            Provider.of<comments_viewModel>(context, listen: false).addComment(content: content,postId: widget.postId);
          }
        },
        keyboardType: TextInputType.text,
      ),
    );
  }
}


class likeButton extends StatefulWidget {
  final String postId;
  final String commentId;
  bool isLike;
    likeButton({required this.isLike,required this.postId,required this.commentId});

  @override
  _likeButtonState createState() => _likeButtonState();
}

class _likeButtonState extends State<likeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()async{
        setState(() {widget.isLike=!widget.isLike;});
        await comments_service.likeComment(postId: widget.postId, commentId: widget.commentId);
      },
      child: widget.isLike? const Icon(Icons.favorite,color: ColorManager.grey1) :
      const Icon(Icons.favorite_border,color: ColorManager.grey1,),

    );
  }
}
