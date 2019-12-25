import 'package:flutter/material.dart';
import 'package:flutter_dart/pages/index.dart';
import 'package:flutter_dart/pages/login.dart';
import 'package:flutter_dart/pages/cate.dart';
import 'package:flutter_dart/pages/movie_list.dart';
import 'package:flutter_dart/pages/share.dart';
import 'package:flutter_dart/pages/movie_detail.dart';
import 'package:flutter_dart/pages/todo_detail.dart';

const pageIndex = '/index';
const pageLogin = '/login';
const pageCate = '/cate';
const pageMovieList = '/movie';
const pageShare = '/share';
const pageMovieDetail = '/movie-detail';
const pageTodoDetail = '/todo/:id';

var RoutePath = {
  '$pageIndex': (context) => MyApp(),
  '$pageLogin': (context) => LoginPage(),
  '$pageCate': (context) => Cate(),
  '$pageMovieList': (context) => MoviePage(),
  '$pageShare': (context) => SharePage(),
  '$pageMovieDetail': (context) => MoiveDetailPage(detailId: ModalRoute.of(context).settings.arguments),
  '$pageTodoDetail': (context) => TodoDetailPage(todo: ModalRoute.of(context).settings.arguments),
};