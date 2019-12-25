import 'package:flutter/material.dart';

class CustomNotification extends Notification {
  CustomNotification(this.msg);

  final String msg;
}

class CustomChild extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return RaisedButton(
      child: Text('Fire Notification'),
      onPressed: () {
        CustomNotification('Hi').dispatch(context);
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState () => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _msg = '通知';

  @override
  Widget build (BuildContext context) {
    return NotificationListener(
      onNotification: (notification) {
        setState(() {
          _msg += notification.msg + '\n';
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_msg),
          CustomChild()
        ],
      ),
    );
  }
}