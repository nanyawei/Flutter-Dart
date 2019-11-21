import 'package:flutter/material.dart';

class SharePage extends StatefulWidget {
  _SharePageState createState () => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('分享'),
      ),
      body: Form(
        autovalidate: true,
        child: Column(
          children: <Widget>[
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                labelText: '姓名',
                hintText: '请输入您的姓名',
                prefixIcon: Icon(Icons.person)
              ),
              validator: (v) {
                return v.trim().length > 0 ? null : '姓名不能为空';
              }
            )
          ],
        ),
      )
    );
  }
}