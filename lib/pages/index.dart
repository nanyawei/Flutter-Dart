import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter/semantics.dart';
import 'package:flutter_dart/constants/constants.dart';
import 'package:flutter_dart/constants/todo.dart';
import 'package:flutter_dart/router/index.dart';

import 'zhihu/index.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final random = Random();
  final todos =
      List<Todo>.generate(30, (i) => Todo('待办事项 $i', '待办事项 $i 的具体做法'));
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  Color _textColor = Colors.black;
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
  
  
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(' Oeschinen 湖',
                      style: TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold)),
                ),
                Text('瑞士 Kandersteg', style: TextStyle(color: Colors.grey))
              ],
            ),
          ),
          Icon(
            Icons.star,
            color: Colors.grey,
          ),
          Text('66')
        ],
      ),
    );

    _navigateAndDisplaySelection() async {
      final result = await Navigator.pushNamed(context, pageCate,
          arguments: CateKind(
              '湖：${random.nextInt(100)}号', '蛋糕：${random.nextDouble()*100}'));

      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('$result'),
      ));
    }

    Column buildButtonColumn(IconData icon, String label) {
      Color color = Theme.of(context).primaryColor;
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(icon, color: color),
          Container(
            child: FlatButton(
              onPressed: () {
                if (icon == (Icons.local_drink)) {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) => Cate()
                  // ));
                  _navigateAndDisplaySelection();
                } else if (icon == (Icons.movie)) {
                  Navigator.pushNamed(context, pageMovieList);
                } else if (icon == (Icons.share)) {
                  Navigator.pushNamed(context, pageShare);
                }
              },
              child: Text('$label',
                  style: TextStyle(
                    color: color,
                    fontSize: 14.0,
                  )),
            ),
          )
        ],
      );
    }

    Widget buttonSection = Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButtonColumn(Icons.movie, '电影'),
          buildButtonColumn(Icons.local_drink, '美食'),
          buildButtonColumn(Icons.share, '分享'),
        ],
      ),
    );

    Widget textsection = Container(
      padding: const EdgeInsets.all(20.0),
      child: Text('''
        奥斯奇宁湖位于伯尔尼阿尔卑斯山脉的蓝色山脉脚下。它位于海拔1578米以上，是较大的高山湖泊之一。从康德斯泰格搭乘贡多拉，然后步行半小时穿过牧场和松树林，就可以到达夏季温度高达20摄氏度的湖泊。这里的娱乐活动包括划船和在夏天骑雪橇跑步。
        ''', style: TextStyle(color: _textColor)),
    );

    Widget widgetVisible = AnimatedOpacity(
      opacity: _visible ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: Container(width: 200, height: 50, color: Colors.green, padding: EdgeInsets.only(bottom: 20.0),child: OutlineButton(child: Text('豆瓣'),onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ZhiHuPage())))),
    );

    Drawer myDrawer() {
      return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Row(
                children: <Widget>[
                  Image.asset('images/logo.jpeg',
                      height: 100, width: 100, fit: BoxFit.cover),
                  Expanded(
                    child: Text('你好像一个大傻子',
                        style: TextStyle(
                            color: _textColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 20)),
                  )
                ],
              ),
              decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            ),
            ListView.builder(
              shrinkWrap: true, // 解决无限高度问题
              physics: NeverScrollableScrollPhysics(), // 禁用滑动事件
              itemCount: todos.length,
              itemBuilder: (BuildContext build, int index) {
                return ListTile(
                  title: Text(todos[index].title),
                  onTap: () {
                    Navigator.pushNamed(context, pageTodoDetail,  arguments: Todo(todos[index].title, todos[index].decription));
                  },
                );
              },
            )
          ],
        ),
      );
    }

    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('跟随flutter创建'),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Image.asset(
                'images/lake.jpg',
                width: 500.0,
                height: 220.0,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textsection,
              widgetVisible,
              showSnackBar()
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.transform),
          onPressed: () {
            setState(() {
              _textColor = Color.fromRGBO(random.nextInt(256),
                  random.nextInt(256), random.nextInt(256), 1);
              _visible = !_visible;
            });
          },
        ),
        // body: CustomScrollView(
        //   slivers: <Widget>[
        //     SliverAppBar(
        //       title: Text('滑动appbar'),
        //       floating: true,
        //       flexibleSpace: Placeholder(),
        //       expandedHeight: 200,
        //     ),
        //     SliverFixedExtentList(
        //     itemExtent: 50.0,
        //     delegate: new SliverChildBuilderDelegate(
        //             (BuildContext context, int index) {
        //           //创建列表项
        //           return new Container(
        //             alignment: Alignment.center,
        //             color: Colors.lightBlue[100 * (index % 9)],
        //             child: new Text('list item $index'),
        //           );
        //         },
        //         childCount: 50 //50个列表项
        //     ),
        //   ),
        //   ],
        // ),
        drawer: myDrawer());
  }
}

class showSnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('点击显示SnackBar'),
        onPressed: () {
          final _snackBar = SnackBar(
            content: Text('提示提示snackbar'),
            action: SnackBarAction(
                label: '操作',
                onPressed: () {
                  print('点击了操作');
                  Navigator.pushNamed(context, pageShare);
                }),
          );

          Scaffold.of(context).showSnackBar(_snackBar);
        },
      ),
    );
  }
}
