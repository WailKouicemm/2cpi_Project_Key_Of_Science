import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';
import 'package:keyofscience/Widgets/shimmerObject.dart';
import 'package:keyofscience/presentation/main/postsPages/view/addPost_view.dart';
import 'package:keyofscience/presentation/main/postsPages/viewModel/PostsPage_viewModel.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';
import 'package:keyofscience/presentation/resources/appStrings.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../../../../Widgets/Post.dart';
import '../../../../models/Models.dart';
import '../../../resources/ColorManager.dart';
import '../../../resources/button.dart';


// class PostsPage extends StatelessWidget {
//   const PostsPage();
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: getThemeData(),
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           appBar: AppBar(
//             title: const Text(AppStrings.post),
//             flexibleSpace: Container(
//               decoration: const BoxDecoration(
//                   image: DecorationImage(
//                       image: AssetImage(images.appBarImage),
//                       fit: BoxFit.cover
//                   )
//               ),
//             ),
//             leading: IconButton(
//               onPressed: ()=>Navigator.pop(context),
//               icon: const Icon(Icons.arrow_back),
//             ),
//           ),
//           body: const Posts_Body(),
//         ),
//     );
//   }
// }

 class PostsScreen extends StatelessWidget {
   const PostsScreen({Key? key}) : super(key: key);

   @override
   Widget build(BuildContext context) {
     return  const Posts_Body();
   }
 }



class Posts_Body extends StatefulWidget {
  const Posts_Body();

  @override
  State<Posts_Body> createState() => _Posts_BodyState();
}

class _Posts_BodyState extends State<Posts_Body> {
   late ScrollController _scrollController;
  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Provider.of<postsPage_modelView>(context,listen: false).getPosts();
    });
    _scrollController = ScrollController()..addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

   void _scrollListener() {
       if ((_scrollController.position.pixels+250)>=_scrollController.position.maxScrollExtent) {
         print("hellwo addPostFrameCallback");
         SchedulerBinding.instance!.addPostFrameCallback((_) {
           Provider.of<postsPage_modelView>(context,listen: false).getPosts();
         });

      }
   }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: ListView(
        controller: _scrollController,
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
                      .copyWith(fontSize: FontSizeManager.s24,fontWeight: FontWeightManager.semiBold),
                  //  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: FontSizeManager.s24),
                ),

                Button(label : AppStrings.addPost, onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_)=>const AddPostPage())
                  );
                } ,
                ),
              ],
            ),
          ),
          Selector<postsPage_modelView,Tuple2<List<Post>,bool>>(
            shouldRebuild: (prec,next){
              print("shoud rebuirebuirebuirebuild ");
              return prec.item1.length!=next.item1.length || prec.item2!=next.item1;
            },
            selector: (_,provider)=>Tuple2(provider.postsList, provider.isLoading),
            builder: (_,data,__)=>ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.item1.length+2,
              itemBuilder: (context,index){
                if(index >= data.item1.length){
                  if(data.item2) {
                    return const shimmerPost();
                  }
                  if(index > data.item1.length) {
                    return const Center();
                  }
                  return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(AppPadding.p20),
                        child: Text(
                            "no more posts",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: FontSizeManager.s10,
                            )
                        ),
                      )
                  );
                }
                 Post tmp = data.item1[index];
    /*
                FirestoreSearchBar(
                  tag: 'example',
                );
     */
                print("$index has rebuilded");
                return PostItem(post: tmp);
              },
            ),
          ),
        ],
      ),
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