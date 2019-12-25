import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter_dart/pages/summation/child.dart';

class ParentPage extends StatefulWidget {
  @override
  _ParentPageState createState () => _ParentPageState();
}

class _ParentPageState extends State<ParentPage> {
  int sum;

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('计算随机数之和')),
      body: RaisedButton(
        child: Column(
          children: <Widget>[
            Text('传递俩个随机数'),
            Text(sum != 0 ? '和为：$sum' : '')
          ],
        ),
        onPressed: () async {
          var number1 = (Random().nextInt(100));
          var number2 = (Random().nextInt(50));
          print(number1);
          print(number2);
          final res = await Navigator.push(context, MaterialPageRoute(builder: (context) => ChildPage(number1: number1, number2: number2,)));
          print(res);
          setState(() {
            sum = res;
          });
        },
      ),
    );
  }
}