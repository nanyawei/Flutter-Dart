import 'package:flutter/material.dart';

class SharePage extends StatefulWidget {
  _SharePageState createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  String name = '';
  String gender = 'male';
  int phone = null;

  TextEditingController _nameController = TextEditingController();

  GlobalKey _userKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('分享'),
        ),
        body: Form(
            key: _userKey,
            autovalidate: true,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  autofocus: true,
                  decoration: InputDecoration(
                      labelText: '姓名',
                      hintText: '请输入您的姓名',
                      prefixIcon: Icon(Icons.person)),
                  validator: (v) {
                    return v.trim().length > 0 ? null : '姓名不能为空';
                  }
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          padding: const EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
                          child: Text(
                            '确认分享'
                          ),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () {
                            if ((_userKey.currentState as FormState).validate()) {

                              // print((_userKey.currentState as FormState).save());
                              // print(name);
                            }

                            print( Form.of(context).validate() );
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
