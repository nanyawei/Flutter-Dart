import 'package:flutter/material.dart';

class HeroPage2 extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('animation hero page2'),
      ),
      body: Hero(
          tag: 'heroPage',
          child: Container(
            width: 300,
            height: 300,
            child: FlutterLogo(),
          ),
        )
    );
  }
}