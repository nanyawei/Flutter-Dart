import 'package:flutter/material.dart';
import 'package:flutter_dart/common/global.dart';
import 'package:flutter_dart/service/service.dart';

RegExp emailReg = RegExp(r"^[a-zA-Z0-9]+@quantibio.com$");

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  GlobalKey _formKey = GlobalKey();
  TextEditingController _useremail = TextEditingController();
  TextEditingController _userpassword = TextEditingController();
  bool passwordShow = false;
  bool _userAutofocus = true;

  // ScrollController _listController = ScrollController(); // listVIew控制器
  // bool isToTop = false; // 当前是否需要启用Top按钮

  @override
  void initState() {
    super.initState();
    print('初始化监听器');
    // WidgetsBinding.instance.addObserver(this); // 注册监听器

    // _listController.addListener(() {
    //   print(_listController);
    //   if (_listController.offset > 1000) {
    //     setState(() {
    //       isToTop = true;
    //     });
    //   } else if (_listController.offset < 300) {
    //     setState(() {
    //       isToTop = false;
    //     });
    //   }
    // });

    // 自动填充上次登录的用户名，填充后将焦点放在密码框
    // _useremail.text = Global.profile.lastLogin;

    // if (_useremail.text != null && emailReg.hasMatch(_useremail.text)) {
    //   setState(() {
    //     _userAutofocus = false;
    //   });
    // } else {
    //   setState(() {
    //     _userAutofocus = true;
    //   });
    // }
  }

  void dispose() {
    super.dispose();
    print('移除监听器');
    // WidgetsBinding.instance.removeObserver(this); // 移除监听器
    // _listController.dispose();
  }

  // void didChangeAppLifecycleState (AppLifecycleState state) async {
  //   print('$state');

  //   // 前台切换到后台 resumed => inactive => paused
  //   // 后台切换到前台 paused => inactive => resumed
  //   if ( state == AppLifecycleState.resumed ) {
  //     // 可见的 并能影响用户输入
  //     print('state--------- resumed');
  //   }
  //   if ( state == AppLifecycleState.inactive ) {
  //     // 处在不活动的状态，无法处理用户响应
  //     print('state--------- inactive');
  //   }
  //   if ( state == AppLifecycleState.paused ) {
  //     // 不可见的并不能影响用户的输入，但是在后台继续活动中
  //     print('state--------- paused');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body:
          // NotificationListener<ScrollNotification>(
          //   onNotification: (scrollNotification) {
          //     print(scrollNotification);
          //     if (scrollNotification is ScrollStartNotification) {
          //       // 滚动开始
          //       print('滚动开始');
          //     } else if (scrollNotification is ScrollUpdateNotification) {
          //       // 滚动更新
          //       print('滚动更新');
          //     } else if (scrollNotification is ScrollEndNotification) {
          //       // 滚动结束
          //       print('滚动结束');
          //     }

          //   },
          //   child: ListView.builder(
          //     cacheExtent: 100,
          //     itemBuilder: (BuildContext context, int index) => ListTile(
          //       title: Text('List Item $index'),
          //     ),
          //     itemCount: 50,
          //   ),
          // )

          // Column(
          //   children: <Widget>[
          //     Container(
          //       height: 50,
          //       child: RaisedButton(
          //         child: Text('Top'),
          //         onPressed: (isToTop
          //             ? () {
          //                 if (isToTop) {
          //                   _listController.animateTo(.0,
          //                       duration: Duration(milliseconds: 200),
          //                       curve: Curves.ease);
          //                 }
          //               }
          //             : null),
          //       ),
          //     ),
          //     Expanded(
          //       child: ListView.builder(
          //         controller: _listController,
          //         itemBuilder: (BuildContext context, int index) => ListTile(
          //           title: Text('List Item $index'),
          //         ),
          //         itemCount: 50,
          //       ),
          //     )
          //   ],
          // )

          Form(
        key: _formKey,
        autovalidate: true,
        child: ListView(
          children: <Widget>[
            TextFormField(
              controller: _useremail,
              autofocus: _userAutofocus,
              decoration: InputDecoration(
                  labelText: '用户邮箱', prefixIcon: Icon(Icons.email)),
              validator: (v) {
                return emailReg.hasMatch(v.trim()) ? null : '请输入正确格式的用户邮箱';
              },
            ),
            TextFormField(
              controller: _userpassword,
              autofocus: !_userAutofocus,
              decoration: InputDecoration(
                  labelText: '密码',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                        passwordShow ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        passwordShow = !passwordShow;
                      });
                    },
                  )),
              obscureText: !passwordShow,
              validator: (v) {
                return v.length >= 6 ? null : '密码长度最少为6位';
              },
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                child: Text('登录', style: TextStyle(color: Colors.white)),
                onPressed: checkState,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );

    // CustomScrollView(
    //   slivers: <Widget>[
    //     SliverAppBar(
    //       title: Text('测试 SliverApper Title'),
    //       floating: true,
    //       flexibleSpace: Image.asset('images/lake.jpg', fit: BoxFit.cover),
    //       expandedHeight: 200, // 图片控件高度
    //     ),
    //     SliverList(
    //       delegate: SliverChildBuilderDelegate(
    //         (BuildContext context, int index) => Card(
    //           child: Text('Item $index', style: TextStyle(height: 10),),
    //         ),
    //         childCount: 10,
    //       ),

    //     )
    //   ],
    // );
  }

  void checkState() {
    if ((_formKey.currentState as FormState).validate()) {
      print('true');
      // 发送登录请求
    } else {
      print('...........');
    }
  }
}
