import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'ui/movie_grid_view.dart';
import 'ui/movie_page_view.dart';

void main() {
  runApp(
    MyApp(), // Wrap your app
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        // primarySwatch: createMaterialColor(Color(0xFF0197D6)),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Movies'),
    );
  }
}

// ignore: must_be_immutable
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.2, 0.9],
          colors: [
            Color(0xFF025269),
            Color(0xFF025269),
            Color(0xFF03303d),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Color(0xFF025269),
          centerTitle: true,
          title: Text(widget.title),
          leading: new IconButton(
            icon: new Icon(
              Icons.menu,
              size: MediaQuery.of(context).size.aspectRatio * 80,
            ),
            onPressed: () {},
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
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
        body: SingleChildScrollView(
          child: Container(
            // color: Colors.blue[100],
            padding: EdgeInsets.only(top: 10),
            child: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MoviePageView(),
                  SizedBox(height: MediaQuery.of(context).size.height / 25),
                  VisibilityDetector(
                    key: Key('now-showing'),
                    onVisibilityChanged: (visibilityInfo) {
                      var visiblePercentage =
                          visibilityInfo.visibleFraction * 100;
                      setState(() {
                        widget.title =
                            visiblePercentage != 0.0 ? 'Movies' : 'Now Showing';
                      });
                    },
                    child: Text(
                      'Now Showing',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height / 35,
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 40),
                  MovieGridView()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
