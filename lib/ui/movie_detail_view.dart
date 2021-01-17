import 'package:flutter/material.dart';
import '../model/movies.dart';
import '../widgets/synopsis.dart';
import '../widgets/movie_poster.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  const MovieDetail({this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF025269),
        title: Text('Movies'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.ios_share,
              size: MediaQuery.of(context).size.aspectRatio * 80,
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: MediaQuery.of(context).size.aspectRatio * 50,
          ),
        ],
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              MoviePoster(size: MediaQuery.of(context).size, movie: movie),
              SizedBox(height: MediaQuery.of(context).size.height / 20),
              Synopsis(size: MediaQuery.of(context).size, movie: movie),
            ],
          ),
          InkWell(
            child: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 2.7,
                right: MediaQuery.of(context).size.height / 38,
                left: MediaQuery.of(context).size.height / 5,
                // bottom: MediaQuery.of(context).size.height / 2.5,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                elevation: 10,
                child: Container(
                  height: MediaQuery.of(context).size.height / 20,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'BOOK NOW',
                    style: TextStyle(
                      color: Color(0xFF025269),
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.width / 25,
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
