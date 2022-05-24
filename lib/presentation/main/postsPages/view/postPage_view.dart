import 'package:flutter/material.dart';
import 'package:keyofscience/Widgets/Post.dart';
import 'package:keyofscience/presentation/main/postsPages/view/comments_view.dart';
import 'package:keyofscience/presentation/resources/App.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';
import 'package:provider/provider.dart';

import '../../../../models/Models.dart';
import '../../../resources/images.dart';
import '../viewModel/PostsPage_viewModel.dart';


class postPage_fromLink extends StatelessWidget {
  final String postId;
  const postPage_fromLink(this.postId);


  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context)=>FutureBuilder<Post?>(
            future: Provider.of<postsPage_modelView>(context,listen: false).getSignelPost(postId),
            builder: (context,snapshot){
              if(snapshot.hasData){
                if(snapshot.data==null){
                  return Container(
                    height: 500,
                    width: 500,
                    color: Colors.grey,
                    child: const Center(
                        child: Text("error error ")
                    ),
                  );
                }
                return postPage_view(snapshot.data!);
              }
              return const MaterialApp(
                debugShowCheckedModeBanner: false,
                home:  Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
        )
    );
  }
}



class postPage_view extends StatefulWidget {
  final Post post;
  const postPage_view(this.post);

  @override
  State<postPage_view> createState() => _postPage_viewState();
}

class _postPage_viewState extends State<postPage_view> {
  late ScrollController scrollController;

  @override
  void initState() {
    print("postpostpostpostpostv ${widget.post.id}");
    scrollController = ScrollController();
    super.initState();
  }
  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeData(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: AppIcons.back
          ),
          title: const Text("Post"),
          flexibleSpace: Image.asset(images.appBarImage,fit: BoxFit.cover,),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                controller: scrollController,
                children: [
                  PostItem(post: widget.post,isInPostPage: true,),
                  const Divider(
                    color: ColorManager.grey1,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(25, 15, 15, 25),
                    child:  Text("comments"),
                  ),
                  comments_list(scrollController: scrollController,postId: widget.post.id,isInPostPage: true,),
                ],
              ),
            ),
            addCommentTextField(widget.post.id),
           ],
        )
      ),
    );
   }
}
