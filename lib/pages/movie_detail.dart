import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dart/constants/movie.dart';
import 'package:flutter_dart/service/service.dart';

String url = '/v2/movie/subject/';

class MoiveDetailPage extends StatefulWidget {
  final String detailId;

  MoiveDetailPage({Key key, this.detailId}) : super(key: key);

  @override
  _MoiveDetailState createState() {
    return _MoiveDetailState();
  }
}

class _MoiveDetailState extends State<MoiveDetailPage> {
  Subjects movieDetail;

  @override
  void initState() {
    super.initState();

    _init();
  }

  _init() async {
    print(widget.detailId);
    HttpUtil.get('$url${widget.detailId}', success: (r) {
      String jsonStr = json.encode(r);
      Map<String, dynamic> jsonMap = json.decode(jsonStr);
      Subjects detail = Subjects.fromJson(jsonMap);
      setState(() {
        movieDetail = detail;
      });
    }, error: (e) {
      print('出错了。。。');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movieDetail == null ? 'loading...' : movieDetail.title),
        ),
        body: Container(
            padding: const EdgeInsets.all(10.0),
            child: movieDetail == null
                ? Center(
                    child: Text('loading...'),
                  )
                : ListView(
                    children: <Widget>[
                      basic(movieDetail),
                      Text('演员阵容:'),
                      Container(
                        height: 200.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: casts(movieDetail.casts),
                        ),
                      ),
                      Text(
                        '剧情简介: \n这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，这是一段剧情简介，',
                      )
                    ],
                  )));
  }

  Widget basic(Subjects subject) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.network(
            subject.images.large,
            fit: BoxFit.cover,
            height: 150.0,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(subject.title.substring(
                    subject.title.indexOf(' ') > -1
                        ? subject.title.indexOf(' ')
                        : 0,
                    subject.title.length)),
                Text(
                  subject.title.split(' ')[0],
                ),
                Text(subject.genres.join(' ')),
                Text('${subject.countries.join(' ')} / ${subject.year}'),
                Text('${subject.wishCount}人想看'),
                
              ],
            ),
          )
        ],
      ),
    );
  }

  List<Widget> casts(List<Casts> casts) {
    return casts.map((item) {
      return ListItem(name: item.name, url: item.avatars.large ?? '');
    }).toList();
  }
}

// @override
class ListItem extends StatelessWidget {
  final String name;
  final String url;

  ListItem({this.name, this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 5.0, 0),
      height: 180.0,
      child: Column(
        children: <Widget>[
          Image.network(
            url ?? '',
            fit: BoxFit.cover,
            height: 150.0,
          ),
          Text(name)
        ],
      ),
    );
  }
}
