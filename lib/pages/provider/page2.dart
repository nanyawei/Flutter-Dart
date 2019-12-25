import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dart/constants/count.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build (BuildContext context) {

    // final _counter = Provider.of<CounterModel>(context);
    // return Scaffold(
    //   body: Text('Counter:${_counter.counter}'),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _counter.increment,
    //     child: Icon(Icons.add),
    //   )
    // );


    return Scaffold(
      body: Center(
        child: Consumer2<CounterModel, double>(
          builder: (context, CounterModel counter, double testSize, _) => 
            Text('Value: ${counter.counter}', style: TextStyle(fontSize: testSize)),
        )
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => FloatingActionButton(
          onPressed: counter.increment,
          child: child,
        ),
        child: TestIcon(),
      ),
    );

  }
}

class TestIcon extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Icon(Icons.add);
  }
}