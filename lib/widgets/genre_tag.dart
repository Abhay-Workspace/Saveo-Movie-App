import 'package:flutter/material.dart';
import '../model/movies.dart';

class GenreTags extends StatelessWidget {
  final size;
  final Movie movie;
  const GenreTags({this.size, this.movie});

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.all(10),
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: movie.genre.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: (orientation == Orientation.portrait) ? 3 : 4,
          childAspectRatio: (2.0),
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(top: 10, right: 10),
            padding: const EdgeInsets.all(3.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: FittedBox(
              child: Text(
                movie.genre[index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.of(context).size.width / 35,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
