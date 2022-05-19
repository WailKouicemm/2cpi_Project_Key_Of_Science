import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../presentation/resources/ColorManager.dart';
import '../presentation/resources/values_manager.dart';

class shimmerPost extends StatelessWidget {
  const shimmerPost();

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
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
      child:  Shimmer.fromColors(
          baseColor: ColorManager.shimmerColor1,
          highlightColor: const Color(0xffe3e3e3).withOpacity(0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// the image of the poster and his name and the date
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    /// the user image
                    _greyContainershimmer(width: 20, height: 20,isAvatar: true,),
                    const SizedBox(
                      width: AppWidth.w10,
                    ),
                    /// the name ad the username
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _greyContainershimmer(  width: width/3, height: 10,),
                        _greyContainershimmer(  width: width/2, height: 10,),

                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppHeight.h10,
              ),
              /// the title of the post
              _greyContainershimmer(width: width/1.3, height: 10,),
              const SizedBox(
                height: AppHeight.h10,
              ),
              /// the post text
              _greyContainershimmer(width: width/1.1, height: 10,),
              const SizedBox(
                height: AppHeight.h10,
              ),
              _greyContainershimmer(width: width/1.1, height: 10,),
              const SizedBox(
                height: AppHeight.h10,
              ),
              _greyContainershimmer(width: width/1.1, height:height*1.4/5),
              /// the icons of like and comment
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  [
                    _greyContainershimmer(width: 20, height: 20,),
                    const  SizedBox(
                      width: AppWidth.w10,
                    ),
                    _greyContainershimmer(width: 20, height: 20,),
                  ],
                ),
              )
            ],
          ),
      )
    );
  }
}


class shimmerComment extends StatelessWidget {
  const shimmerComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return  Shimmer.fromColors(
      baseColor:  ColorManager.shimmerColor1,
      highlightColor: const Color(0xffe3e3e3).withOpacity(0.5),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _greyContainershimmer(height: 0, width: 0,isAvatar: true,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _greyContainershimmer(height: 12, width: width/4,),
                      _greyContainershimmer(height: 12, width: width/2,),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}

class _greyContainershimmer extends StatelessWidget {
  final double width;
  final double height;
  bool isAvatar;
    _greyContainershimmer({required this.height,required this.width, this.isAvatar=false});

  @override
  Widget build(BuildContext context) {
    return isAvatar ? const Padding(
      padding:  EdgeInsets.all(10),
      child:  CircleAvatar(
        maxRadius: 25,
        backgroundColor: ColorManager.shimmerColor1,
      ) ) :
    Container(
      height: height,
      width: width,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: ColorManager.shimmerColor1,
          borderRadius: BorderRadius.circular(15)
      ),
    );

  }
}
