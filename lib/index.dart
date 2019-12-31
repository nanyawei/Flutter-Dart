import 'package:flutter/material.dart';
import 'package:flutter_dart/router/index.dart';

import 'package:flutter_dart/generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'pages/scan.dart';

Widget myApp = MaterialApp(
  // home: Global.profile.user != null ? MyApp() : LoginPage(),
  localizationsDelegates: const [
    S.delegate, // 应用程序的翻译回调
    GlobalMaterialLocalizations.delegate, // Materail组件的翻译回调
    GlobalWidgetsLocalizations.delegate //普通Widget的翻译回调
  ],
  supportedLocales: S.delegate.supportedLocales, // 支持语系
  onGenerateTitle: (context) {
    return S.of(context).app_title;
  },
  theme: ThemeData(
    primarySwatch: Colors.lightBlue,
    // brightness: Brightness.dark
  ),
  title: '设置的title',
  routes: RoutePath,
  home: MyCodePage(),
  // onGenerateRoute: (RouteSettings settings) {
  //   print('build route for ${settings.name}');
  //   var routes = <String, WidgetBuilder>{
  //     // "hello": (ctx) => Hello(settings.arguments),
  //     // "other": (ctx) => SomeWidget(),
  //   };
  //   WidgetBuilder builder = routes[settings.name];
  //   return MaterialPageRoute(builder: (ctx) => builder(ctx));
  // },
);










//     Column buildButtonColumn (IconData icon, String label) {
//       Color color = Theme.of(context).primaryColor;

//       return Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Icon(icon, color: color),
//           Container(
//             // child: Text(
//             //   '$label',
//             //   style: TextStyle(
//             //     color: color,
//             //     fontSize: 14.0
//             //   )
//             // ),
//             child: FlatButton(
//               onPressed: () {
//                 if (icon == (Icons.local_drink)) {
//                   print('点击跳转S');
//                   // Navigator.push(context, MaterialPageRoute(
//                   //   builder: (context) => Cate()
//                   // ));
//                   Navigator.pushNamed(context, pageCate);
//                   print('点击跳转E');

//                 }
//               },
//               child: Text(
//                 '$label',
//                 style: TextStyle(
//                   color: color,
//                   fontSize: 14.0,

//                 )
//               ),
//             ),
//           )
//         ],
//       );
//     }

//     Widget buttonSection = Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: <Widget>[
//           buildButtonColumn(Icons.call, '致电'),
//           buildButtonColumn(Icons.local_drink, '美食'),
//           buildButtonColumn(Icons.share, '分享'),
//         ],
//       ),
//     );

//     Widget textsection = Container(
//       padding: const EdgeInsets.all(20.0),
//       child: Text(
//         '''
//         奥斯奇宁湖位于伯尔尼阿尔卑斯山脉的蓝色山脉脚下。它位于海拔1578米以上，是较大的高山湖泊之一。从康德斯泰格搭乘贡多拉，然后步行半小时穿过牧场和松树林，就可以到达夏季温度高达20摄氏度的湖泊。这里的娱乐活动包括划船和在夏天骑雪橇跑步。
//         '''
//       ),
//     );

//     return Scaffold(
//         appBar: AppBar(
//           title: Text('跟随flutter创建'),
//         ),
//         body: ListView(
//           children: <Widget>[
//             Image.asset(
//               'images/lake.jpg',
//               width: 500.0,
//               height: 220.0,
//               fit: BoxFit.cover,
//             ),
//             titleSection,
//             buttonSection,
//             textsection
//           ],
//         ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// void main () => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Image.asset('images/logo.jpeg'),
//     );
//   }
// }

// // import 'package:flutter/material.dart';

// // void main () {
// //   runApp(
// //     MaterialApp(
// //       title: '页面跳转返回数据',
// //       home: FirstPage(),
// //     )
// //   );
// // }

// // class FirstPage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('找小姐姐要电话'),
// //       ),
// //       body: Center(
// //         child: RouteButton(),
// //       ),
// //     );
// //   }
// // }

// // class RouteButton extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return RaisedButton(
// //       onPressed: () {
// //         _navigateToXiaoJieJie(context);
// //       },
// //       child: Text('去找小姐姐'),
// //     );
// //   }

// //   _navigateToXiaoJieJie(BuildContext context) async {

// //     final result = await Navigator.push(context,
// //       MaterialPageRoute(builder: (context) => XiaoJieJie())
// //     );

// //     Scaffold.of(context).showSnackBar(SnackBar(content: Text('$result')));
// //   }
// // }

// // class XiaoJieJie extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('小姐姐详情'),
// //       ),
// //       body: Center(
// //         child: Column(
// //           children: <Widget>[
// //             RaisedButton(
// //               child: Text('大长腿小姐姐'),
// //               onPressed: () {
// //                 Navigator.pop(context, '大长腿小姐姐 电话：1509998898');
// //               }
// //             ),
// //             RaisedButton(
// //               child: Text('小蛮腰小姐姐'),
// //               onPressed: () {
// //                 Navigator.pop(context, '小蛮腰小姐姐 电话：13278456675');
// //               }
// //             ),

// //           ],
// //         ),
// //       )
// //     );
// //   }
// // }

// // // import 'package:flutter/material.dart';

// // // class Product {
// // //   final String title; // 商品标题
// // //   final String description; // 商品描述

// // //   Product (this.title, this.description); // 构造函数
// // // }

// // // void main () {
// // //   runApp(MaterialApp(
// // //     title: '导航的数据传递和接收',
// // //     home: ProductList(
// // //       products: List.generate(
// // //         20,
// // //         (i) => Product('商品 $i', '这是一个商品详情，编号$i')
// // //       )
// // //     ),
// // //   ));
// // // }

// // // class ProductList extends StatelessWidget {
// // //   final List<Product> products;

// // //   ProductList({Key key, @required this.products}):super(key: key);

// // //   @override
// // //   Widget build (BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('商品列表'),
// // //       ),
// // //       body: ListView.builder(
// // //         itemCount: products.length,
// // //         itemBuilder: (context, index) {
// // //           return ListTile(
// // //             title: Text(products[index].title),
// // //             onTap: (){
// // //               Navigator.push(context, MaterialPageRoute(
// // //                 builder: (context) => ProductDetail(product: products[index])
// // //               ));
// // //             }
// // //           );
// // //         } ,
// // //       ),
// // //     );
// // //   }
// // // }

// // // class ProductDetail extends StatelessWidget {
// // //   final Product product;

// // //   ProductDetail({Key key, @required this.product}):super(key: key);

// // //   @override
// // //   Widget build (BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('${product.title}')
// // //       ),
// // //       body: Text('${product.title} ${product.description}'),
// // //     );
// // //   }
// // // }

// // // // import 'package:flutter/material.dart';

// // // // void main () {
// // // //   runApp(MaterialApp(
// // // //     title: '导航演示01',
// // // //     home: new FirstScreen(),
// // // //   ));
// // // // }

// // // // class FirstScreen extends StatelessWidget {
// // // //   @override
// // // //   Widget build (BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('导航页面'),
// // // //       ),
// // // //       body: Center(
// // // //         child: RaisedButton(
// // // //           child: Text('查看商品详情页'),
// // // //           onPressed: (){
// // // //             Navigator.push(context, MaterialPageRoute(
// // // //               builder: (context) => SecondScreen()
// // // //             ));
// // // //           },
// // // //         ),
// // // //       )
// // // //     );
// // // //   }
// // // // }

// // // // class SecondScreen extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text('第二个导航 商品详情页'),
// // // //       ),
// // // //       body: Center(
// // // //         child: RaisedButton(
// // // //           child: Text('返回'),
// // // //           onPressed: () {
// // // //             Navigator.pop(context);
// // // //           },
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }

// // // // // import 'package:flutter/material.dart';

// // // // // void main () => runApp(MyApp());

// // // // // class MyApp extends StatelessWidget {

// // // // //   @override
// // // // //   Widget build ( BuildContext context ) {
// // // // //     var card = new Card(
// // // // //       child: Column(
// // // // //         children: <Widget>[
// // // // //           ListTile(
// // // // //             title: new Text(
// // // // //               '北京市昌平区',
// // // // //               style: TextStyle(
// // // // //                 fontWeight: FontWeight.w500,
// // // // //               )
// // // // //             ),
// // // // //             subtitle: new Text('电话：123455643'),
// // // // //             leading: new Icon(Icons.phone, color: Colors.lightGreen),
// // // // //           ),
// // // // //           new Divider(),
// // // // //            ListTile(
// // // // //             title: new Text(
// // // // //               '北京市丰台区',
// // // // //               style: TextStyle(
// // // // //                 fontWeight: FontWeight.w500,
// // // // //               )
// // // // //             ),
// // // // //             subtitle: new Text('电话：1230987'),
// // // // //             leading: new Icon(Icons.phone, color: Colors.lightGreen),
// // // // //           ),
// // // // //           new Divider(),
// // // // //            ListTile(
// // // // //             title: new Text(
// // // // //               '北京市房山区',
// // // // //               style: TextStyle(
// // // // //                 fontWeight: FontWeight.w500,
// // // // //               )
// // // // //             ),
// // // // //             subtitle: new Text('电话：1845759'),
// // // // //             leading: new Icon(Icons.phone, color: Colors.lightGreen),
// // // // //           )
// // // // //         ],
// // // // //       ),
// // // // //     );

// // // // //     return MaterialApp(
// // // // //       title: 'my flutter demo',
// // // // //       home: Scaffold(
// // // // //         appBar: new AppBar(
// // // // //           title: new Text('卡片列表'),
// // // // //         ),
// // // // //         body: Center(
// // // // //           child: card
// // // // //         )
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // // }

// // // // // // import 'package:flutter/material.dart';

// // // // // // void main () => runApp(MyApp());

// // // // // // class MyApp extends StatelessWidget {
// // // // // //   @override
// // // // // //   Widget build ( BuildContext context ) {
// // // // // //     return MaterialApp(
// // // // // //       title: 'text widget',
// // // // // //       home: Scaffold(
// // // // // //         body: Center(
// // // // // //           child: Container(
// // // // // //             child: new Image.network(
// // // // // //               'http://blogimages.jspang.com/blogtouxiang1.jpg',
// // // // // //               repeat: ImageRepeat.repeat,
// // // // // //             ),
// // // // // //             width: 300.0,
// // // // // //             height: 400.0,
// // // // // //             color: Colors.lightBlue
// // // // // //           ),
// // // // // //         ),
// // // // // //       ),
// // // // // //     );
// // // // // //   }
// // // // // // }

// // // // // // // import 'package:flutter/material.dart';
// // // // // // // import 'package:english_words/english_words.dart';

// // // // // // // void main () => runApp(MyApp());

// // // // // // // class MyApp extends StatelessWidget {
// // // // // // //   @override
// // // // // // //   Widget build ( BuildContext context ) {

// // // // // // //     return new MaterialApp(
// // // // // // //       title: '楠',
// // // // // // //       theme: new ThemeData(
// // // // // // //         primaryColor: Colors.white
// // // // // // //       ),
// // // // // // //       home: new RandomWords(),

// // // // // // //       // title: 'welcome , get out',
// // // // // // //       // home: Scaffold(
// // // // // // //       //   appBar: new AppBar(
// // // // // // //       //     title: new Text('new title')
// // // // // // //       //   ),
// // // // // // //       //   body: new Center(
// // // // // // //       //     child: new RandomWords(),
// // // // // // //       //   )
// // // // // // //       // ),
// // // // // // //     );
// // // // // // //   }
// // // // // // // }

// // // // // // // class RandomWords extends StatefulWidget {
// // // // // // //   @override
// // // // // // //   RandomWordState createState() => new RandomWordState();
// // // // // // // }

// // // // // // // class RandomWordState extends State<RandomWords> {
// // // // // // //   @override
// // // // // // //   Widget build ( BuildContext context ) {
// // // // // // //     // final wordPair = new WordPair.random();
// // // // // // //     // return new Text(wordPair.asPascalCase);
// // // // // // //     return new Scaffold(
// // // // // // //       appBar: new AppBar(
// // // // // // //         title: new Text('Startup Name Generator'),
// // // // // // //         actions: <Widget>[
// // // // // // //           new IconButton(icon: const Icon(Icons.list), onPressed: _pushSaved,)
// // // // // // //         ],
// // // // // // //       ),
// // // // // // //       body: _buildSuggestions()
// // // // // // //     );
// // // // // // //   }

// // // // // // //   final List<WordPair> _suggestions = <WordPair>[];
// // // // // // //   final Set<WordPair> _saved = new Set<WordPair>();
// // // // // // //   final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

// // // // // // //   Widget _buildSuggestions() {
// // // // // // //     return new ListView.builder(
// // // // // // //       padding: const EdgeInsets.all(16.0),
// // // // // // //       itemBuilder: (BuildContext _context, int i) {
// // // // // // //         if (i.isOdd) {
// // // // // // //           return new Divider();
// // // // // // //         }

// // // // // // //         final int index = i ~/ 2;
// // // // // // //         if (index >= _suggestions.length) {
// // // // // // //           _suggestions.addAll( generateWordPairs().take(10) );
// // // // // // //         }
// // // // // // //         return _buildRow(_suggestions[index]);
// // // // // // //       }
// // // // // // //     );
// // // // // // //   }

// // // // // // //   Widget _buildRow(WordPair pair) {
// // // // // // //     final bool alreadySaved = _saved.contains(pair);

// // // // // // //     return new ListTile(
// // // // // // //       title: new Text(
// // // // // // //         pair.asPascalCase,
// // // // // // //         style: _biggerFont
// // // // // // //       ),
// // // // // // //       trailing: new Icon(
// // // // // // //         alreadySaved ? Icons.favorite : Icons.favorite_border,
// // // // // // //         color: alreadySaved ? Colors.red : null
// // // // // // //       ),
// // // // // // //       onTap: () {
// // // // // // //         setState(() {
// // // // // // //           if (alreadySaved) {
// // // // // // //             _saved.remove(pair);
// // // // // // //           } else {
// // // // // // //             _saved.add(pair);
// // // // // // //           }
// // // // // // //         });
// // // // // // //       },
// // // // // // //     );
// // // // // // //   }

// // // // // // //   void _pushSaved () {
// // // // // // //     Navigator.of(context).push(
// // // // // // //       new MaterialPageRoute<void> (
// // // // // // //         builder: (BuildContext context) {
// // // // // // //           final Iterable<ListTile> tiles = _saved.map(
// // // // // // //             (WordPair pair) {
// // // // // // //               return new ListTile(
// // // // // // //                 title: new Text(
// // // // // // //                   pair.asPascalCase,
// // // // // // //                   style: _biggerFont
// // // // // // //                 )
// // // // // // //               );
// // // // // // //             }
// // // // // // //           );
// // // // // // //           final List<Widget> divided = ListTile.divideTiles(
// // // // // // //             context: context,
// // // // // // //             tiles: tiles
// // // // // // //           ).toList();

// // // // // // //           return new Scaffold(
// // // // // // //             appBar: new AppBar(
// // // // // // //               title: const Text('Saved Suggestions')
// // // // // // //             ),
// // // // // // //             body: new ListView(children: divided,)
// // // // // // //           );
// // // // // // //         }
// // // // // // //       )
// // // // // // //     );
// // // // // // //   }
// // // // // // // }
