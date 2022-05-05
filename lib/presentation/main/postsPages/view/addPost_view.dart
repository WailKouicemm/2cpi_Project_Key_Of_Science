
import 'dart:io';

import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyofscience/presentation/main/postsPages/viewModel/addPost_viewModel.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';
import 'package:keyofscience/presentation/resources/appStrings.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../resources/ColorManager.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage();

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
          providers: [
            ChangeNotifierProvider<addpost_viewModel>(create: (_)=>addpost_viewModel())
          ],
          child: Builder(
            builder: (ctx)=> Stack(
              children: [
                Scaffold(
                    backgroundColor: ColorManager.white,
                    appBar: AppBar(
                      elevation: AppElevation.e0,
                      backgroundColor: ColorManager.white,
                      leading: IconButton(
                          onPressed: () {
                            Navigator.pop(ctx);
                          },
                          icon: AppIcons.back),
                      actions: [
                        Selector<addpost_viewModel, bool>(
                          shouldRebuild: (_,__)=>true,
                            selector: (_,provider)=> provider.isUploading,
                            builder: (_,isUploading,__){
                              print("isuploadingisuploading $isUploading");
                              return  isUploading ? Container(
                                padding: const EdgeInsets.only(right: AppPadding.p20),
                                alignment: Alignment.center,
                                child: const CircularProgressIndicator()
                              ) : const Center();
                            }
                        )
                      ],
                    ),
                    body: Padding(
                        padding: const EdgeInsets.fromLTRB(AppPadding.p20, AppPadding.p20, AppPadding.p20, 0),
                        child: Form(
                          key: _formKey,
                          child: ListView(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// add post title
                              Padding(
                                padding: const EdgeInsets.only(bottom: AppPadding.p20),
                                child: Text(
                                  AppStrings.addPost,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(fontSize: FontSizeManager.s24),
                                ),
                              ),

                              /// title
                              const _text(AppStrings.title),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    AppPadding.p4, AppPadding.p10, AppPadding.p4, AppPadding.p20),
                                child: TextFormField(
                                  style: const TextStyle(color: Colors.black),
                                  controller: _titleController,
                                  cursorColor: ColorManager.defaultColor,
                                  decoration: const InputDecoration(
                                    hintText: AppStrings.post_title,
                                  ),
                                  validator: (title)=>validators.titleValidator(title?? ''),
                                ),
                              ),

                              /// content
                              const _text(AppStrings.content),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    AppPadding.p4, AppPadding.p10, AppPadding.p4, AppPadding.p20),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    hintText: AppStrings.post_content,
                                  ),
                                  controller: _contentController,
                                  cursorColor: ColorManager.defaultColor,
                                  maxLines: 15,
                                  validator: (content)=>validators.contentValidator(content?? ''),
                                ),
                              ),


                              // /// images
                              // Row(
                              //   children: [
                              //     const _text(AppStrings.pictures),
                              //     IconButton(
                              //         onPressed: ()=>Provider.of<addpost_viewModel>(context,listen: false)
                              //             .pickeImages_fromGallery(),
                              //         icon: const Icon(Icons.add)),
                              //   ],
                              // ),

                              const _showImages(),
                              const SizedBox(
                                height: AppHeight.h10,
                              ),
                              /// post button
                              Align(
                                alignment: Alignment.centerRight,
                                child: ElevatedButton(
                                  onPressed: (){
                                     if(_formKey.currentState!.validate()){
                                       FocusScope.of(context).unfocus();
                                    Provider.of<addpost_viewModel>(ctx,listen: false)
                                        .uploadPost(
                                      title: _titleController.text.trim(),
                                      content: _contentController.text.trim(),
                                       context: context
                                    );
                                     }
                                  },
                                  child: const Text(AppStrings.post),
                                ),
                              ),
                              const SizedBox(height: AppHeight.h20,),
                            ],
                          ),
                        ))),
                Selector<addpost_viewModel, bool>(
                    shouldRebuild: (_,__)=>true,
                  selector: (_,provider)=>provider.isUploading,
                  builder: (_,isuploading,__){
                      print("isuploadingisuploading $isuploading");
                    return isuploading ? Container(
                      height: double.infinity,
                      width: double.infinity,
                      color: ColorManager.transparent,
                    ) : const Center();
                  }
                )
              ],
            )
          ),
        );
  }
}

class _text extends StatelessWidget {
  final String text;

  const _text(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(fontSize: FontSizeManager.s18),
    );
  }
}



class _imagesDialog extends StatelessWidget {
  const _imagesDialog();

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      insetPadding: const EdgeInsets.all(AppPadding.p25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppPadding.p25),
      ),
      actionsPadding: const EdgeInsets.all(AppPadding.p5),
      title: Text(AppStrings.add_images,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline4
      ),
      content: Column(
        children: [
          Row(
            children: [

            ],
          )
        ],
      ),
    );
  }
}


class _showImages extends StatelessWidget {
  const _showImages();

  @override
  Widget build(BuildContext context) {
    return  Selector<addpost_viewModel, List<XFile>>(
        shouldRebuild: (previous, next){
          return true;
        },
        selector: (_,provider)=>provider.pickedImages,
        builder: (_,images,__)=> images.isEmpty ? InkWell(
          onTap:  ()=>Provider.of<addpost_viewModel>(context,listen: false)
           .pickeImages_fromGallery(),
          splashColor: Colors.transparent,
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(AppPadding.p25),
              margin: const EdgeInsets.symmetric(vertical: AppMargin.m10),
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.grey),
              ),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(AppStrings.selectImages,
                      style: Theme.of(context).textTheme.caption
                  ),
                  const Icon(Icons.hide_image_outlined,color: ColorManager.grey,)
                ],
              )
          ),
        ) : GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: images.length>2 ? 3 : images.length,
              childAspectRatio: 1,
              crossAxisSpacing: 3.0,
              mainAxisSpacing: 3.0,
            ),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: images.map((image) =>
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: FileImage(File(image.path)),
                        fit: BoxFit.fill
                    ),
                  ),
                  alignment: Alignment.topRight,
                  padding: const EdgeInsets.all(AppPadding.p5),
                  child: CircleAvatar(
                    backgroundColor: ColorManager.grey.withOpacity(0.4),
                    radius: 15,
                    child: IconButton(
                      onPressed: ()=>Provider.of<addpost_viewModel>(context,listen: false).removeImage(image),
                      icon: const Icon(Icons.close,color: ColorManager.white,size: 15,),
                    ),
                  ),
                )
            ).toList()
        )
    );
  }
}
