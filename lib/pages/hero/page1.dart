import 'package:flutter/material.dart';
import 'package:flutter_dart/pages/hero/page2.dart';

class HeroPage1 extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation hero page1'),
      ),
      body: GestureDetector( // 监听手势变化
        child: Hero(
          tag: 'heroPage',
          child: Container(
            width: 100,
            height: 100,
            child: FlutterLogo(),
          ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) => HeroPage2()
            )
          );
        },
      ),
    );
  }
}