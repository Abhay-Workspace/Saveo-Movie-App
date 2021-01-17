import 'package:flutter/material.dart';
import 'package:saveo_movie_app/ui/movie_detail_view.dart';
import '../model/movies.dart';
import '../sample_data/sample_movies.dart';

class MovieGridView extends StatefulWidget {
  MovieGridView({Key key}) : super(key: key);

  @override
  _MovieGridViewState createState() => _MovieGridViewState();
}

class _MovieGridViewState extends State<MovieGridView> {
  List<Movie> movies = getMovies();
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: movies.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: (orientation == Orientation.portrait) ? 3 : 4,
        childAspectRatio: (0.8),
      ),
      itemBuilder: (BuildContext context, int index) {
        return Hero(
          tag: '${movies[index].id}',
          child: Material(
            color: Colors.transparent,
            elevation: 100,
            child: Container(
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.fromLTRB(10, 30, 10, 0),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 25.0,
                    spreadRadius: 2,
                    offset: Offset(2, -5),
                  ),
                ],
                // borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(movies[index].image),
                  fit: BoxFit.cover,
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (_, __, ___) =>
                          MovieDetail(movie: movies[index]),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
