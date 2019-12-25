import 'package:flutter/material.dart';


class MyAppPage extends StatefulWidget {
  @override
  _MyAppPageState createState () => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  int count;

  @override
  void initState () {
    super.initState();
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('aaa')
        // title: Text(S.of(context).main_title),
      ),
      body:Column(
        children: <Widget>[
          // Text(S.of(context).message_tip(count.toString())),
          Text(count.toString()),
          // Image.asset(
          //   S.of(context).picture_url,
          //   width: 300.0,
          //   fit: BoxFit.cover,
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            count += 1;
          });
        },
      ),
    );
  }
}

