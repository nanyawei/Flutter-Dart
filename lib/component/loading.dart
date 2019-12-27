import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  final bool loading;
  final Widget child;
  final String msg;

  ProgressDialog(
      {Key key, @required this.loading, @required this.child, this.msg})
      : assert(child != null),
        assert(loading != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    //如果正在加载，则显示加载添加加载中布局
    if (loading) {
      print('....................');
      print(msg);
      print('....................');

      widgetList.add(Stack(children: <Widget>[
        Opacity(
          opacity: 0.8,
          child: ModalBarrier(
            dismissible: false,
            color: Colors.black87,
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              CircularProgressIndicator(),
              Text(msg ?? '加载中',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, height: 2.6))
            ],
          ),
        )
      ]));
    }
    return Stack(
      children: widgetList,
    );
  }
}
