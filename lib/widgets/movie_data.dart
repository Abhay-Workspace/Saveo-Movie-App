import 'package:flutter/material.dart';
import '../model/movies.dart';
import 'package:intl/intl.dart';
import './genre_tag.dart';
import './rating_stars.dart';

class MovieData extends StatelessWidget {
  final size;
  final Movie movie;
  const MovieData({this.size, this.movie});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(sw / 50, sh / 75, 0, 0),
          child: Text(
            movie.name,
            softWrap: true,
            style: TextStyle(
              color: Colors.white,
              fontSize: MediaQuery.of(context).size.width / 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(sw / 50, sh / 75, 0, 0),
          child: Row(
            children: [
              FittedBox(
                child: Text(
                  '${movie.censorRating}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(left: sw / 100, right: sw / 100),
                height: MediaQuery.of(context).size.height / 45,
                width: MediaQuery.of(context).size.width / 200,
              ),
              FittedBox(
                child: Text(
                  '${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}min',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(left: sw / 100, right: sw / 100),
                height: MediaQuery.of(context).size.height / 45,
                width: MediaQuery.of(context).size.width / 200,
              ),
              FittedBox(
                child: Text(
                  '${DateFormat('dd MMM, yyyy').format(movie.releaseDate)}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 30.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        GenreTags(size: MediaQuery.of(context).size, movie: movie),
        Row(
          children: [
            RatingStars(size: MediaQuery.of(context).size, movie: movie),
            FittedBox(
              child: Text(
                '${movie.rating}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width / 23.0,
                ),
              ),
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: sw / 50),
          child: Row(
            children: [
              FittedBox(
                child: Text(
                  'Reviews: ${movie.criticsCount}(Critics)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 30.0,
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                margin: EdgeInsets.only(left: sw / 100, right: sw / 100),
                height: MediaQuery.of(context).size.height / 45,
                width: MediaQuery.of(context).size.width / 200,
              ),
              FittedBox(
                child: Text(
                  '${movie.userCount}(User)',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 30.0),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
