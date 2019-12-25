import 'package:flutter/material.dart';

class UpdatedItemModel {
  String appIcon;
  String appName;
  String appSize;
  String appDate;
  String appDescription;
  String appVersion;
  UpdatedItemModel(
      {this.appIcon,
      this.appName,
      this.appSize,
      this.appDate,
      this.appDescription,
      this.appVersion});
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // 使用控制Tabbar切换
  TabController _tabController;

  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(icon: Icon(Icons.system_update), text: '组合'),
            Tab(icon: Icon(Icons.cake), text: '自绘'),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          ListView(
            children: <Widget>[
              UpdatedItemWidget(model: UpdatedItemModel(
                appIcon: 'images/googleIcon.png',
                appDescription:"Thanks for using Google Maps! This release brings bug fixes that improve our product to help you discover new places and navigate to them.",
                appName: "Google Maps - Transit & Fond",
                appSize: '137.2',
                appVersion: 'Version 5.19',
                appDate: '2019年12月12日'
              ), onPressed: () {
                print('打印出来了........');
              },)
            ],
          ),
          Center(child: 
          // Cake()
          Text('aaa')
          ,)
        ],
      ),
    );
  }
}

class UpdatedItemWidget extends StatelessWidget {
  final UpdatedItemModel model;
  final VoidCallback onPressed;
  UpdatedItemWidget({Key key, this.model, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[buildTopRow(context),buildBottom(context)],
    );
  }

  Widget buildTopRow(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              model.appIcon,
              width: 80,
              height: 80,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.appName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF8E8D92),
                      fontSize: 20
                    )
                  ),
                  Text(
                    model.appDate,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Color(0xFF8E8D92),
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            )
          ),
          FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text('OPEN', style: TextStyle(color: Colors.white, fontSize: 20.0)),
            onPressed: onPressed,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0))
          )
        ],
      )
    );
  }

  Widget buildBottom(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            model.appDescription,
            style: TextStyle(
              color: Colors.black87,
              fontSize: 20
            )
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Text(
              '${model.appVersion} • ${model.appSize }MB',
              style: TextStyle(
                color: Colors.black38,
                fontSize: 20
              )
            )
          ),
          OutlineButton(
            child: Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}
