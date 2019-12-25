import 'package:flutter/material.dart';

class ChildPage extends StatefulWidget {
  ChildPage({Key key, this.number1, this.number2}): super(key: key);

  final int number1;
  final int number2;

  @override
  _ChildPageState createState () => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  double sum;



  @override
  Widget build (BuildContext context) {


    return Scaffold(
      appBar: AppBar(title: Text('点击回到上一页面，并返回随机数之和')),
      body: RaisedButton(
        child: Column(
          children: <Widget>[
            Text('number1: ${widget.number1}\nnumber2:${widget.number2}'),
            Text('传递俩个随机数之和')
          ],
        ),
        onPressed: () {
            Navigator.pop(context, (widget.number1 + widget.number2));
        },
      ),
    );
  }
}