import 'package:flutter/material.dart';
import '../model/movies.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RatingStars extends StatelessWidget {
  final size;
  final Movie movie;
  const RatingStars({this.size, this.movie});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SmoothStarRating(
        rating: movie.rating,
        isReadOnly: false,
        //size: 80,
        filledIconData: Icons.star,
        halfFilledIconData: Icons.star_half,
        defaultIconData: Icons.star_border,
        starCount: 5,
        color: Colors.white,
        allowHalfRating: true,
        spacing: 2.0,
      ),
    );
  }
}
