import 'package:flutter/material.dart';
import '../model/movies.dart';

class ImageBox extends StatelessWidget {
  final size;
  final Movie movie;
  const ImageBox({this.size, this.movie});

  @override
  Widget build(BuildContext context) {
    final sh = MediaQuery.of(context).size.height;
    final sw = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      elevation: 100,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.fromLTRB(sw / 25, sh / 75, 0, 0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 50.0,
              spreadRadius: 5,
              offset: Offset(5, 0),
            ),
          ],
          // borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: imageProvider(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  imageProvider() {
    if (movie.image[0] == 'l')
      return AssetImage(movie.image);
    else
      return NetworkImage(
        movie.image,
      );
  }
}
