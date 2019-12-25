import 'dart:io';

import 'package:flutter/material.dart';

class HttpPage extends StatefulWidget {
  @override
  _HttpPageState createState () => _HttpPageState();
}

class _HttpPageState extends State<HttpPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('请求'),
      ),
      body: Text(''),
    );
  }

  get () async {
    // 创建网络调用事例，设置通用请求行为（超时时间）
    var httpClient = HttpClient();
    httpClient.idleTimeout = Duration(seconds: 5);

    // 构造URI，设置user-agent为'Custom-UA'
    var uri = Uri.parse('https://flutter.dev');
    var request = await httpClient.getUrl(uri);
    request.headers.add('user-agent', 'Custom-UA');

    // 发起请求，等待响应
    var response = await request.close();

    // 收到请求，打印结果
    if (response.statusCode == HttpStatus.ok) {
      // print(await response.transform(utf8.decoder).join());
    } else {
      print('ERROR:\n status ${response.statusCode}');
    }


  }
}