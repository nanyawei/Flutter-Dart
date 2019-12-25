import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  AppConfig({
    this.apiBaseUrl,
    this.appName,
    Widget child
  }):super(child: child);

  final String appName;
  final String apiBaseUrl;

  // 方便子widget在widget树中找到它
  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  // 判断是否需要子widget更新。由于是应用入口，无需更新
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;
}