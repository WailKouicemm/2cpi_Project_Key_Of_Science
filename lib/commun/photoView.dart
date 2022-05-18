import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';


class ImagePage extends StatefulWidget {
  final int currentpage;
  final List imagesList;
  const ImagePage({required this.currentpage,required this.imagesList});

  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  late int _currentpage;
  @override
  void initState() {
      _currentpage = widget.currentpage;
    super.initState();
  }
  @override
  Widget build(BuildContext ctx) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    final PageController _pageController = PageController(initialPage: _currentpage);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
         backgroundColor: Colors.black,
         elevation: 0.0,
          leading: IconButton(
            onPressed: ()=>Navigator.pop(ctx),
            icon: const Icon(Icons.arrow_back,color: Colors.white,),
          ),
          title: Text(
            '${_currentpage+1} / ${widget.imagesList.length}',
          ),
          // centerTitle: true,
          // title: Text(
          //   '$currentpage / ${widget.imagesList.length}',
          //   style: const TextStyle(
          //       fontWeight: FontWeight.bold
          //   ),
          // ),
        ),
        // extendBodyBehindAppBar: true,
        body:  SizedBox(
          height: MediaQuery.of(ctx).size.height,
          width: MediaQuery.of(ctx).size.width,
          child:   PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(widget.imagesList[index]),
                  heroAttributes: PhotoViewHeroAttributes(tag: widget.imagesList[index]),
                );
              },
              itemCount: widget.imagesList.length,
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
              loadingBuilder: (context, event) => const Center(
                child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(),
                ),
              ),
              pageController: _pageController,
              onPageChanged: (page)=>setState(()=>_currentpage=page),
            ),
        ),
      ),
    );
  }
}

 