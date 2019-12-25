// import 'dart:io';


// // 创建文件目录
// Future<File> get _localFile async {
//   final directory = await getApplicationDocumentsDirectory();
//   final path = directory.path;
//   return File('$path/content.txt');
// }

// // 将字符串写入文件
// Future<File> writeContent(String content) async {
//   final file = await _localFile;
//   return file.writeAsString(content);
// }

// // 从文件中读取字符串
// Future<String> readContent() async {
//   try {
//     final file = await _localFile;
//     String contents = await file.readAsString();
//     return contents;
//   } catch (e) {
//     return '';
//   }
// }