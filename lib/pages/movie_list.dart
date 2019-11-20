import 'package:flutter/material.dart';
import 'package:flutter_app_test/constants/constants.dart';
import 'package:flutter_app_test/service/service.dart';
import 'dart:convert';

String url = '/v2/movie/top250';

class MoviePage extends StatefulWidget {
  _MovieState createState () => _MovieState();
}

class _MovieState extends State<MoviePage> {
  dynamic top250;
  List topList;

  @override
  void initState () {
    super.initState();
    _getList();
  }

  void _getList  () async {
    HttpUtil.get(
      url,
      data: {
        'start': 0,
        'count': 1
      }, 
      success: (r) {
        // final rMap = json.decode(r);
        var movie = Movie.fromJson( json.decode(r) );

        print(movie);
        print('......');
        setState(() {
          top250 = movie;
        });

      },
      error: (e) {
        print('错误提示：$e');
      }
    );
  }


  @override 
  Widget build (BuildContext build) {
  


    return Scaffold(
      appBar: AppBar(
        title: Text('list'),
      ),
      body: Text('1'),
    );
  }
}