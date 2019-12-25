import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './index.dart';
import 'common/app.dart';


void main() {
  /* 通过dart提供的编译常数判断环境
   * 
   * 采用断言的方式，其相关代码会在 Release 构建中被完全剔除；
   * 而如果使用 kReleaseMode 常量来识别 Debug 环境，虽然这段代码永远不会在 Release 环境中执行，
   * 但却会被打入到二进制包中，增大包体积。
   * 因此，如果没有特殊需求的话，一定要使用断言来实现 Debug 特有的逻辑，
   * 或是在发布期前将使用 kReleaseMode 判断的 Debug 逻辑完全删除。
  */
 
  // var configuredApp = AppConfig(
  //   appName: kReleaseMode ? 'example' : 'dev',
  //   apiBaseUrl: kReleaseMode ? 'https://api.quantibio.com' : 'https://dev-api.quantibio.com',
  //   child: myApp
  // );


  var configuredApp = AppConfig(
    appName: 'example',
    apiBaseUrl: 'https://api.quantibio.com',
    child: myApp
  );

  // debugPaintSizeEnabled = true;
  runApp(configuredApp);
}
