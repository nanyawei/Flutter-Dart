import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  final  onItemSelected;

  ListWidget({
    this.onItemSelected
  });

  @override
  _ListWidgetState createState () => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build (BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(index.toString()),
          onTap: () => widget.onItemSelected(index), // 点击后回调函数
        );
      },
    );
  }
}

// 详情widget
class DetailWidget extends StatefulWidget {
  final int data; // 新闻列表被点击元素的索引

  DetailWidget({this.data});

  @override
  _DetailWidgetState createState () => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
  @override
  Widget build (BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.data.toString()) // 剧中展示列表被点击元素
          ],
        ),
      ),
    );
  }
}