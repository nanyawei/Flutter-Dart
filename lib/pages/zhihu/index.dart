import 'dart:convert';

import 'package:flutter/material.dart';
import '../../component/loading.dart';
import '../../constants/movie.dart';
import '../../service/service.dart';

String url = '/v2/movie/top250';

class ZhiHuPage extends StatefulWidget {
  @override
  _ZhiHuPageState createState() => _ZhiHuPageState();
}

class _ZhiHuPageState extends State<ZhiHuPage> {
  List<Subjects> _list;
  int curpage = 1;
  ScrollController _controller = ScrollController();

  bool isloading = true;
  String loadingMsg;

  @override
  void initState() {
    super.initState();
    getInitDate();

    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        print('滑到了底部 --------------------------');
        getInitDate();
      }
    });
  }

  @override
  void dispose () {
    super.dispose();
    _controller.dispose();
  }

  getInitDate() {

    if (curpage == 1) {
      setState(() {
        _list = [];
      });
    }

    HttpUtil.get(
      url,
      data: {'start': ((curpage - 1)*5), 'count': 5},
      success: (res) {
        print(res);
        String strRes = json.encode(res);
        Map<String, dynamic> jsonRes = json.decode(strRes);
        movie dataRes = movie.fromJson(jsonRes);

        setState(() {
          curpage++;
          _list.addAll(dataRes.subjects);
          isloading = false;
          loadingMsg = '加载完成';
        });
      },
      error: (e) {
        print('请求失败');
        setState(() {
          isloading = false;
          loadingMsg = '加载失败';
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('下拉刷新，上拉加载'),
        ),
        body: ProgressDialog(
            loading: isloading,
            msg: loadingMsg,
            child: Container(
                child: RefreshIndicator(
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (BuildContext context, int index) =>
                    subjectItem(_list[index]),
                controller: _controller,
              ),
              onRefresh: _handleRefresh,
            ))));
  }

  Widget subjectItem(Subjects item) {
    return Card(
      child: Text(item.title, style: TextStyle(height: 10.0)),
    );
  }

  Future<Null> _handleRefresh() async {
    // 模拟延迟数据加载
    setState(() {
      curpage = 1;
    });
    await getInitDate();
    print('再次请求');
  }
}
