import 'package:flutter/material.dart';
import 'package:flutter_dart/router/index.dart';
import 'package:flutter_dart/service/service.dart';
import 'dart:convert';
import 'package:flutter_dart/constants/movie.dart';

String url = '/v2/movie/top250';

class MoviePage extends StatefulWidget {
  _MovieState createState () => _MovieState();
}

class _MovieState extends State<MoviePage> {
  movie top250;

  @override
  void initState () {
    super.initState();
    _getList();
  }

  _getList () async {
    HttpUtil.get(
      url,
      data: {
        'start': 0,
        'count': 250
      }, 
      success: (r) {
        String jsonStr = json.encode(r);
        Map<String, dynamic> jsonMap = json.decode(jsonStr);
        movie data = movie.fromJson(jsonMap);
        setState(() {
          top250 = data;
        });
      },
      error: (e) {
        print('错误提示：$e');
      }
    );
  }

  @override 
  Widget build (BuildContext build) {
    print(top250);
    return Scaffold(
      appBar: AppBar(
        title: Text('Top 250'),
      ),
      body: top250 == null ?
            Center(child: Text('loading...'),) :
            Container(
              padding: const EdgeInsets.all(5.0),
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 0.7,
                children: List.generate(top250.subjects.length, (index) {
                  return movieItem(top250.subjects[index]);
                }),
              ),
            )
    );
  }

  void _handleTap (int id) {
    final String detailId = id.toString();
    Navigator.pushNamed(context, pageMovieDetail, arguments: detailId);
  }

  Container movieItem (Subjects subject) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () => _handleTap(subject.id),
        child: Stack(
          overflow: Overflow.clip,
          fit: StackFit.expand,
          children: <Widget>[
            Image.network(
              subject.images.large,
              fit: BoxFit.cover,
            ),
            
            Positioned(
              bottom: 10.0,
              left: 10.0,
              right: 10.0,
              child: Center(
                child: Text(
                  subject.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    background: Paint()..color = Colors.white,
                  )
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}