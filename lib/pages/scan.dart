import 'package:flutter/material.dart';
import 'package:flutter_dart/component/snapshot/index.dart';

class MyCodePage extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: AppBar(title: Text('')),
      body: CodePage(),
    );
  }
}

class CodePage extends StatefulWidget {
  @override
  _CodePageState createState() => _CodePageState();
}

class _CodePageState extends State<CodePage> {
  String code = "";

  @override
  void initState () {
    super.initState();
  }


  @override 
  Widget build (BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(code),
          RaisedButton(
            child: Icon(Icons.scanner),
            onPressed: () async {
              var res = await Navigator.push(context, MaterialPageRoute(builder: (context) => RScanDialog()));

              print (res);

              setState(() {
                code = res ?? '扫描失败，请重试！';
              });
            },
          )
        ],
      ),
    );
  }
}
