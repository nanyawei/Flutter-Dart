import 'package:dio/dio.dart';

class BaseUrl {
  static const String url = 'http://t.yushu.im';
}


class HttpUtil {
  static void get (
    String url, 
    {
      Map<String, dynamic> data,
      Map<String, dynamic> headers,
      Function success,
      Function error
    }
  ) async {
    // 对接收到的请求参数进行处理
    if ( data != null && data.isNotEmpty ) {
      StringBuffer options = new StringBuffer('?');
      data.forEach((key, value) {
        options.write('$key=$value&');
      });
      String optionsStr = options.toString();
      optionsStr = optionsStr.substring(0, optionsStr.length-1);
      url += optionsStr;
    }

    // 发送get请求
    await _sendRequest (
      url,
      'get',
      success,
      headers: headers,
      error: error
    );
  }

  static void post (
    String url,
    {
      Map<String, dynamic> data,
      Map<String, dynamic> headers,
      Function success,
      Function error
    }
  ) async {
    await _sendRequest(url, 'post', success, data: data, headers: headers, error: error);
  }


  static Future _sendRequest (
    String url,
    String method,
    Function success,
    {
      Map<String, dynamic> data,
      Map<String, dynamic> headers,
      Function error
    }
  ) async {
    int _code;
    String _msg;
    var _backData;

    // 检测请求地址是否完整地址
    if ( !url.startsWith('http') ) {
      url = BaseUrl.url + url;
    }

    try {
      Map<String, dynamic> dataMap = data ?? new Map();
      Map<String, dynamic> headersMap = headers ?? new Map();

      // 配置dio请求信息
      Response response;
      Dio dio = new Dio();
      dio.options.connectTimeout = 10000; // 服务器链接超时，毫秒
      dio.options.receiveTimeout = 3000;  // 响应流上前后俩次接收到数据的间隔，毫秒
      dio.options.headers.addAll(headersMap);

      if (method == 'get') {
        response = await dio.get(url);
      } else {
        response = await dio.post(url, data: dataMap);
      }

      if (response.statusCode != 200 ) {
        _msg = '网络请求错误，状态码' + response.statusCode.toString();
        _handError(error, _msg);
        return;
      }

      // 返回处理结果
      Map<String, dynamic> resCallbackMap = response.data;

      _code = resCallbackMap['code'];
      _msg = resCallbackMap['msg'];
      _backData = resCallbackMap['data'];
 
      if ( success != null ) {
        // if (_code == 0) {
          success(resCallbackMap);
        // } else {
        //   String errorMsg = _code.toString() + ':' + _msg;
        //   _handError(error, errorMsg);
        // }
      }

    } catch (exception) {
      print('test 2');
      _handError (error, '数据请求错误：'+ exception.toString());
    }
  }

  static Future _handError (
    Function errorCallback, String errorMsg
  ) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    } else {
      errorCallback('发生了什么什么错误......');
    }
  }
}
