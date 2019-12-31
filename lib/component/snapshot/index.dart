import 'package:flutter/material.dart';
import 'package:flutter_dart/component/snapshot/scan_image.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:r_scan/r_scan.dart';

class RScanDialog extends StatefulWidget {
  @override
  _RScanDialogState createState() => _RScanDialogState();
}

class _RScanDialogState extends State<RScanDialog> {
  RScanController _controller;

  @override
  void initState() {
    super.initState();
    initController();
  }

  bool isFirst = true;

  Future<void> initController() async {
    _controller = RScanController();
    _controller.addListener(() {
      final result = _controller.result;
      if (result != null) {
        if (isFirst) {
          Navigator.pop(context, result.message);
          isFirst = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: FutureBuilder<bool>(
          future: canOpenCameraView(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData && snapshot.data == true) {
              return Stack(
                children: <Widget>[
                  ScanImageView(
                    child: RScanView(
                      controller: _controller,
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: FutureBuilder(
                        future: getFlashMode(),
                        builder: _buildFlashBtn,
                      ))
                ],
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Future<bool> getFlashMode() async {
    bool isOpen = false;
    try {
      isOpen = await _controller.getFlashMode();
    } catch (_) {}
    return isOpen;
  }

  Future<bool> canOpenCameraView() async {
    var status =
        await PermissionHandler().checkPermissionStatus(PermissionGroup.camera);
    if (status != PermissionStatus.granted) {
      var future = await PermissionHandler()
          .requestPermissions([PermissionGroup.camera]);
      for (final item in future.entries) {
        if (item.value != PermissionStatus.granted) {
          return false;
        }
      }
    } else {
      return true;
    }
    return true;
  }

  Widget _buildFlashBtn(BuildContext context, AsyncSnapshot<bool> snapshot) {
    return snapshot.hasData
        ? Padding(
            padding: EdgeInsets.only(
                bottom: 24 + MediaQuery.of(context).padding.bottom),
            child: IconButton(
                icon: Icon(snapshot.data ? Icons.flash_on : Icons.flash_off),
                color: Colors.white,
                iconSize: 46,
                onPressed: () {
                  if (snapshot.data) {
                    _controller.setFlashMode(false);
                  } else {
                    _controller.setFlashMode(true);
                  }
                  setState(() {});
                }),
          )
        : Container();
  }
}
