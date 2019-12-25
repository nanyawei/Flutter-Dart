import 'package:flutter/material.dart';

import '../common/app.dart';

class EnvPage extends StatefulWidget {
  @override 
  _EnvPageState createState () => _EnvPageState();
}

class _EnvPageState extends State<EnvPage> {
  var selectedValue = 0;

  @override
  void initState () {
    super.initState();
  }

  @override 
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text(AppConfig.of(context).appName)
      ),
      body: Center(
        child: Text(AppConfig.of(context).apiBaseUrl)
      ),
    );
  }
}