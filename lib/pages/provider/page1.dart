import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dart/constants/count.dart';
import './page2.dart';

class Page1 extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    // 取出资源
    final _counter = Provider.of<CounterModel>(context);
    final testSize = Provider.of<double>(context);
    return Scaffold(
      body: Center(
       child: Text('Counter:${_counter.counter}', style: TextStyle(fontSize: testSize)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Page2())
        ),
      ),
    );
  }
}