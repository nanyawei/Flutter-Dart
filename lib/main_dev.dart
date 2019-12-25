import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './index.dart';
import 'common/app.dart';

void main() {
  var configuredApp = AppConfig(
    appName: 'dev',
    apiBaseUrl: 'https://dev-api.quantibio.com',
    child: myApp
  );

  debugPaintSizeEnabled = true;
  runApp(configuredApp);
}
