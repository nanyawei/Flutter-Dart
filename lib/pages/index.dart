import 'package:flutter/material.dart';
import 'package:flutter_app_test/constants/constants.dart';
import 'package:flutter_app_test/router/index.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
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
                  child: Text(
                    ' Oeschinen 湖',
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontWeight: FontWeight.bold
                    )
                  ),
                ),
                Text(
                  '瑞士 Kandersteg',
                  style: TextStyle(
                    color: Colors.grey
                  )
                )
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

    Column buildButtonColumn (IconData icon, String label) {
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
                  Navigator.pushNamed(
                    context,
                    pageCate,
                    arguments: CateKind('湖', '蛋糕')
                  );
                } else if (icon == (Icons.movie)) {
                  Navigator.pushNamed(
                    context,
                    pageMovieList
                  );
                } else if (icon == (Icons.share)) {
                  Navigator.pushNamed(context, pageShare);
                }
              },
              child: Text(
                '$label',
                style: TextStyle(
                  color: color,
                  fontSize: 14.0,
                  
                )
              ),
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
      child: Text(
        '''
        奥斯奇宁湖位于伯尔尼阿尔卑斯山脉的蓝色山脉脚下。它位于海拔1578米以上，是较大的高山湖泊之一。从康德斯泰格搭乘贡多拉，然后步行半小时穿过牧场和松树林，就可以到达夏季温度高达20摄氏度的湖泊。这里的娱乐活动包括划船和在夏天骑雪橇跑步。
        '''
      ),
    );


    return Scaffold(
        appBar: AppBar(
          title: Text('跟随flutter创建'),
        ),
        body: ListView(
          children: <Widget>[
            Image.asset(
              'images/lake.jpg',
              width: 500.0,
              height: 220.0,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textsection
          ],
        ),
    );
  }
}