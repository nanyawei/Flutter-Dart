import 'package:flutter_app_test/pages/cate.dart';
import 'package:flutter_app_test/pages/index.dart';
import 'package:flutter_app_test/pages/movie_list.dart';
import 'package:flutter_app_test/pages/share.dart';


const pageIndex = '/index';
const pageCate = '/cate';
const pageMovieList = '/movie';
const pageShare = '/share';


var RoutePath = {
  '$pageIndex': (context) => MyApp(),
  '$pageCate': (context) => Cate(),
  '$pageMovieList': (context) => MoviePage(),
  '$pageShare': (context) => SharePage()
};