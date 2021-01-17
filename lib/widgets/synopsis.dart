import 'package:flutter/material.dart';
import '../model/movies.dart';

class Synopsis extends StatelessWidget {
  final size;
  final Movie movie;
  const Synopsis({this.size, this.movie});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15.0),
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              'Synopsis',
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              movie.synopsis,
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 16.0,
                height: 1.5,
              ),
            ),
          )
        ],
      ),
    );
  }
}
