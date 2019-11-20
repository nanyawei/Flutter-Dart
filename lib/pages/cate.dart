import 'package:flutter/material.dart';
import 'package:flutter_app_test/constants/constants.dart';

class Cate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    CateKind cateKind = ModalRoute.of(context).settings.arguments;



    return Scaffold(
      appBar: AppBar(
        title: Text('${cateKind.local}'),
      ),
      body: Container(
        height: 200.0,
        child:  Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
              children: <Widget>[
                Text('草莓蛋糕'),
                Text(
                  '这是一块草莓蛋糕好吃的。这是一块草莓蛋糕好吃的。这是一块草莓蛋糕好吃的。',
                  style: TextStyle(
                    color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 12.0,
                  )
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(Icons.star, size: 12.0),
                          Icon(Icons.star, size: 12.0),
                          Icon(Icons.star, size: 12.0),
                          Icon(Icons.star, size: 12.0),
                          Icon(Icons.star, size: 12.0)
                        ],
                      ),
                      Text(
                        '170',
                         style: TextStyle(
                           fontSize: 12.0
                         ) 
                      )
                    ],
                  ),
                )
              ],
            ),
            ),
            Expanded(
              flex: 2,
              child: Image.asset('images/cake.png')
            )
          ],
        ),
      )
    );
  }
}
