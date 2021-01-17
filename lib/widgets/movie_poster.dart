import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import '../model/movies.dart';
import './movie_data.dart';
import './image_box.dart';

class MoviePoster extends StatelessWidget {
  final size;
  final Movie movie;
  const MoviePoster({this.size, this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF025269),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: '${movie.id}',
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width / 2.5,
              child: FractionallySizedBox(
                heightFactor: 0.7,
                widthFactor: 1.0,
                alignment: Alignment.topLeft,
                child: Stack(
                  children: <Widget>[
                    ImageBox(size: MediaQuery.of(context).size, movie: movie),
                    Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.play_circle_outline_rounded,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.height / 12,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width / 30.0),
          Expanded(
            child: DelayedDisplay(
              delay: Duration(milliseconds: 400),
              slidingCurve: Curves.decelerate,
              slidingBeginOffset: const Offset(0.35, 0.0),
              child: MovieData(size: MediaQuery.of(context).size, movie: movie),
            ),
          ),
        ],
      ),
    );
  }
}
