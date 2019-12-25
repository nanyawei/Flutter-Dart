import 'package:flutter/material.dart';

class CountContainer extends InheritedWidget {
  static CountContainer of(BuildContext context) => context.inheritFromWidgetOfExactType(CountContainer);

  final int count;

  CountContainer({
    Key key,
    this.count,
    Widget child
  }): super(key: key);

  bool updateShouldNotify(CountContainer oldWidget) => count != oldWidget.count;
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState () => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build (BuildContext context) {
    return CountContainer(
      count: 0,
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CountContainer state = CountContainer.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget demo'),
      ),
      body: Text(
        ' 你已经点击了这个按钮${state.count}了'
      ),
    );
  }
}