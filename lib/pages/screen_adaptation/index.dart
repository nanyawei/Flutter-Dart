// import 'package:flutter/material.dart';

// import 'container.dart';

// class MasterDetailPage extends StatefulWidget {
//   @override 
//   _MasterDetailPageState createState () => _MasterDetailPageState();
// }

// class _MasterDetailPageState extends State<MasterDetailPage> {
//   var selectedValue = 0;

//   @override
//   void initState () {
//     super.initState();
//   }

//   @override 
//   Widget build (BuildContext context) {
//     return Scaffold(
//       appBar: AppBar( 
//         title: Text('屏幕适配')
//       ),
//       body: OrientationBuilder(
//         builder: ( BuildContext context, Orientation orientation ) {
//           if ( MediaQuery.of(context).size.width > 480 ) {
//             return Row(
//               children: <Widget>[
//                 Expanded(
//                   child: ListWidget(onItemSelected: (value) {
//                     setState(() {
//                       selectedValue = value;
//                     });
//                   }),
//                 ),
//                 Expanded(child: DetailWidget(data: selectedValue,),)
//               ],
//             );
//           } else {
//             return ListWidget(onItemSelected: (value) {
//               Navigator.push(context, MaterialPageRoute(builder: (context) {
//                 return Scaffold(body: DetailWidget(data: value));
//               }));
//             });
//           }
//         },
//       ),
//     );
//   }
// }