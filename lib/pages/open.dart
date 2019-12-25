import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const platform = MethodChannel('samples.chenhang/utils');

class OpenMarketPage extends StatelessWidget {

  void handleButtonClick () async {

    int result;
    try {
      result = await platform.invokeMethod('openAppMarket', <String, dynamic> {
        'appId': 'com.xxx.xxx',
        'packageName': 'xxx.com.xxx'
      });
    } catch (e) {
      result = -1;
    }
    print('Result: $result');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('open market'),
      ),
      body: RaisedButton(
        child: Text('去应用市场'),
        onPressed: () => handleButtonClick(),
      )
    );
  }
}