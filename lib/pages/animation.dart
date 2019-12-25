import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    
    // // 第一种方法 此种方法 repeat 和 forward 只需要一个就可以了
    // controller = AnimationController(
    //   duration: const Duration(milliseconds: 1000),
    //   vsync: this,
      
    // );
    // animation = Tween(begin: 50.0, end: 200.0).animate(controller)
    //   ..addListener(() {
    //     setState(() {
    //       // 刷新界面
    //     });
    //   });
    // controller.repeat(reverse: true);
    // // controller.forward();
    

    // // 第二种方法
    controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    final CurvedAnimation curve =
        CurvedAnimation(parent: controller, curve: Curves.elasticOut);

    animation = Tween(begin: 50.0, end: 200.0).animate(curve)
      ..addListener(() {
        setState(() {
          // 刷新界面
        });
      });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    controller.forward(); // 启动动画
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation Builder'),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: animation,
          child: FlutterLogo(),
          builder: (BuildContext context, Widget child) => Container(
            width: animation.value,
            height: animation.value,
            child: child,
          ),
        ),
      ),
    );
    
    // Scaffold(
    //   body: Center(
    //     child: AnimatedLogo(animation: animation,),
    //   ),
    // );


    // Center(
    //   child: Container(
    //     width: animation.value,
    //     height: animation.value,
    //     child: FlutterLogo(),
    //   ),
    // );
  }

  @override
  void dispose() {
    controller.dispose(); //释放资源
    super.dispose();
  }
}

class AnimatedLogo extends AnimatedWidget {
  // AnimatedWidget需要在初始化的时候传入animation对象
  AnimatedLogo({Key key, Animation<double> animation}): super(key: key, listenable: animation);

  Widget build (BuildContext context){
    // 取出动画
    final Animation<double> animation = listenable;
    return Center(
      child: Container(
        height: animation.value, // 根据动画对象的当前状态更新宽高
        width: animation.value,
        child: FlutterLogo(),
      ),
    );
  }
}
