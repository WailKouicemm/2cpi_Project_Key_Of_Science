import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:keyofscience/presentation/main/homeScreen/view/MainScreen.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tuple/tuple.dart';

import '../../../../Widgets/Course_card.dart';
import '../../../../models/Models.dart';
import '../../../resources/FontsManager.dart';
import '../../../resources/values_manager.dart';
import '../viewModel/courses_page_viwModel.dart';


List<String> categories = const [
  "Ai",
  "Web development",
  "Design UI/UX",
  "Mobile developement",
  "Data Structure"
];


class booksScreen extends StatelessWidget {
  const booksScreen();

  @override
  Widget build(BuildContext context) {
    return coursesScreen(isBook: true,);
  }
}

class coursesScreen extends StatelessWidget {
  final bool isBook;
  const coursesScreen({this.isBook = false});

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        backgroundColor: ColorManager.primaryColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
              categories.map((cateogry) =>
              courses_category_part(cateogry,isBook: isBook,),
              ).toList()

          ),
        ),
      ) ;
  }
}



class courses_category_part extends StatelessWidget {
  final String cateogry;
  final bool isBook;
  const courses_category_part(this.cateogry,{this.isBook = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Title_Text(txt: cateogry, seAll: false),
        courses_listview(cateogry,isBook:isBook),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}

class courses_listview extends StatelessWidget {
  final String category;
  final bool isBook;
  final bool popular;
  const courses_listview(this.category,{this.isBook=false,this.popular = false});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<courses_viewmodel>(create: (_) => courses_viewmodel()),
      ],
      child: isBook? _booksListview(category,popular:popular) : _courses_listView(category),
    );
  }
}

class _courses_listView extends StatefulWidget {
  final String category;
  const _courses_listView(this.category);

  @override
  State<_courses_listView> createState() => _courses_listViewState();
}

class _courses_listViewState extends State<_courses_listView> {
  late ScrollController _scrollController;
  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Provider.of<courses_viewmodel>(context,listen: false).getCoursees(category: widget.category);
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
    if ((_scrollController.position.pixels+50)>=_scrollController.position.maxScrollExtent) {
      print("hellwo addPostFrameCallback");
      SchedulerBinding.instance!.addPostFrameCallback((_) {
        Provider.of<courses_viewmodel>(context,listen: false).getCoursees(category: widget.category);
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height:  height * 0.22,
      width:  width,
      child: Selector<courses_viewmodel,Tuple2<List<course>,bool>>(
        shouldRebuild: (prec,next){
          return prec.item1.length!=next.item1.length || prec.item2!=next.item1;
        },
        selector: (_,provider)=>Tuple2(provider.courses[widget.category] ?? [], provider.isLoading),
        builder: (_,data,__)=>ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: data.item1.length+2,
          itemBuilder: (context,index){
            if(index >= data.item1.length){
              if(data.item2) {
                return const coyurse_shimmer();
              }
              if(index > data.item1.length) {
                return const Center();
              }
              return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppPadding.p20),
                    child: Text(
                        "no more courses",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: FontSizeManager.s10,
                        )
                    ),
                  )
              );
            }
            course tmp = data.item1[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: cours_card(cours: tmp),
            );
          },
        ),
      ),
    );
  }
}

class coyurse_shimmer extends StatelessWidget {
  const coyurse_shimmer();

  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double cardWidth = width * 0.8;
    return  Shimmer.fromColors(
      baseColor: ColorManager.shimmerColor1,
      highlightColor: const Color(0xffe3e3e3).withOpacity(0.5),
      child:  Container(
        width: cardWidth,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius:BorderRadius.circular(AppRadius.r15),
        ),
      )
    );

  }
  }

class _booksListview extends StatefulWidget {
  final String category;
  final bool popular;
  const _booksListview(this.category,{this.popular=false});

  @override
  State<_booksListview> createState() => _booksListviewState();
}

class _booksListviewState extends State<_booksListview> {
  late ScrollController _scrollController;
  @override
  void initState() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      Provider.of<courses_viewmodel>(context,listen: false).getCoursees(category: widget.category,isBook: true,popular:widget.popular);
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
    if ((_scrollController.position.pixels+50)>=_scrollController.position.maxScrollExtent) {
      SchedulerBinding.instance!.addPostFrameCallback((_) {
        Provider.of<courses_viewmodel>(context,listen: false).getCoursees(category: widget.category,isBook: true);
      });

    }
  }
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height:  height * 0.22,
      width:  width,
      child: Selector<courses_viewmodel,Tuple2<List<Book>,bool>>(
        shouldRebuild: (prec,next){
          return prec.item1.length!=next.item1.length || prec.item2!=next.item1;
        },
        selector: (_,provider)=>Tuple2(provider.books[widget.category] ?? [], provider.isLoading),
        builder: (_,data,__)=>ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: data.item1.length+2,
          itemBuilder: (context,index){
            if(index >= data.item1.length){
              if(data.item2) {
                return const coyurse_shimmer();
              }
              if(index > data.item1.length) {
                return const Center();
              }
              return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppPadding.p20),
                    child: Text(
                        "no more courses",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: FontSizeManager.s10,
                        )
                    ),
                  )
              );
            }
            Book tmp = data.item1[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: book_card(book: tmp,)
            );
          },
        ),
      ),
    );
  }
}
