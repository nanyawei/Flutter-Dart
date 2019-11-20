import 'package:flutter_app_test/pages/cate.dart';
import 'package:flutter_app_test/pages/index.dart';
import 'package:flutter_app_test/pages/movie_list.dart';


const pageIndex = '/index';
const pageCate = '/cate';
const pageMovieList = '/movie';


var RoutePath = {
  '$pageIndex': (context) => MyApp(),
  '$pageCate': (context) => Cate(),
  '$pageMovieList': (context) => MoviePage()
};