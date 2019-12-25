import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SampleView extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    print(defaultTargetPlatform);
    // 使用Android平台的AndroidView，传入唯一标识符sampleView
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(viewType: 'sampleView android');
    } else {
      return UiKitView(viewType: 'sampleView ios');
    }
  }
}
