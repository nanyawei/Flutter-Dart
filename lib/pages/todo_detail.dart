import 'package:flutter/material.dart';
import 'package:flutter_dart/constants/todo.dart';

class TodoDetailPage extends StatefulWidget {
  final Todo todo;

  TodoDetailPage({Key key, this.todo}): super(key: key);
  @override
  _TodoDetailPageState createState () => _TodoDetailPageState();
}

class _TodoDetailPageState extends State<TodoDetailPage> {
  Todo todo;

  @override
  void initState () {
    super.initState();
    todo = widget.todo;
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo != null ? todo.title : ''),
      ),
      body: ListTile(
        leading: Text(todo.title),
        title: Text(todo.decription),
      )
    );
  }
}