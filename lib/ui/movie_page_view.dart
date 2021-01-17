import 'package:flutter/material.dart';
import '../sample_data/sample_movies.dart';

class MoviePageView extends StatefulWidget {
  MoviePageView({Key key}) : super(key: key);

  @override
  _MoviePageViewState createState() => _MoviePageViewState();
}

class _MoviePageViewState extends State<MoviePageView> {
  int currentpage = 4;

  PageController controller;

  @override
  initState() {
    super.initState();
    controller = PageController(
      initialPage: currentpage,
      viewportFraction: 0.75,
    );
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  final movieList = getMovies();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.0,
      // margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 60),
      child: PageView.builder(
        onPageChanged: (value) {
          setState(() {
            currentpage = value;
          });
        },
        controller: controller,
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return poster(
            index,
            movieList[index].image,
            movieList[index].name,
          );
        },
      ),
    );
  }

  poster(index, image, name) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double value = 1.0;
        if (controller.position.haveDimensions) {
          value = controller.page - index;
          value = (1 - (value.abs() * .5)).clamp(0.0, 1.0);
        }

        return Center(
          child: Container(
            height: Curves.easeOut.transform(value) * 280,
            width: Curves.easeOut.transform(value) * 750,
            color: Colors.transparent,
            child: child,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 8, right: 8, bottom: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(movieList[index].image),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 20.0,
              spreadRadius: 5.0,
              offset: Offset(
                0.0,
                15.0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
