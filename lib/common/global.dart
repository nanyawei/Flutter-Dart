import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dart/models/index.dart';
import 'package:flutter_dart/service/service.dart';
// import 'package:flutter_dart/common/git.dart';
// import 'package:flutter_dart/models/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import '../models/profile.dart';
import 'dart:convert';


const _themes = <MaterialColor>[
  Colors.pink,
  Colors.blue
];

class Global {
  static SharedPreferences _prefs;
  static Profile profile = Profile();

  // 网络缓存对象
  // static NetCache netCache = NetCache();

  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => bool.fromEnvironment('dart.vm.product');

  // 初始化全局信息， 会在APP启动时执行
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
    var _profile = _prefs.getString('prefile');
    print(_profile);
    if ( _profile == null ) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        print('ERROR  _profile: =========> $e');
      }
    }

    // 如果没有缓存策略，这只默认缓存策略
    // profile.cache = profile.cache ?? CacheConfig()
    //   ..enable = true
    //   ..maxAge = 3600
    //   ..maxCount = 100;

    // 初始化网络请求相关配置
    HttpUtil.init();
  }

  // 持久化Profile信息
  static saveProfile () => _prefs.setString('profile', jsonEncode(profile.toJson));
}

class ProfileChangeNotifier extends ChangeNotifier {
  Profile get _profile => Global.profile;

  @override
  void notifyListeners () {
    Global.saveProfile(); // 保存Profile变更
    super.notifyListeners(); // 通知依赖的Widget更新
  }
}

// 用户状态
class UserModel extends ProfileChangeNotifier {
  User get user => _profile.user;

  // App是否登录（如果有用户信息，则证明登录过）
  bool get isLogin => user != null;

  // 用户信息发生变化，更新用户信息并通知依赖他的子孙Widgets更新
  set user (User user) {
    if ( user?.login != _profile.user?.login ) {
      _profile.lastLogin = _profile.user?.login;
      _profile.user = user;
      notifyListeners();
    }
  }
}

// 主题状态在用户更换App主题时更新、通知其依赖项
class ThemeModel extends ProfileChangeNotifier {
  ColorSwatch get theme => Global.themes.firstWhere((e) => e.value == _profile.theme, orElse: () => Colors.blue);

  // 主题改变后，通知其依赖项，新主题会立即生效
  set theme (ColorSwatch color) {
    if (color != theme) {
      _profile.theme = color[500].value;
      notifyListeners();
    }
  }
}

// // 当App语言选为跟随系统（Auto）时，在系统语言改变时，App语言会更新；
// // 当用户在APP选定了具体语言时，则App便会一直使用用户选定的语言，不会再随系统语言而变。
// class LocaleModel extends ProfileChangeNotifier {
//   // 获取当前用户的App语言配置，如果为null，则语言跟随系统语言
//   Locale getLocale () {
//     if (_profile.locale == null) return null;
//     var t = _profile.locale.split('_');
//     return Locale(t[0], t[1]);
//   }

//   // 获取当前Local的字符串表示
//   String get locale => _profile.locale;

//   // 用户改变App语言后，通知依赖项更新，新语言会立即生效
//   set locale(String locale) {
//     if (locale != _profile.locale) {
//       _profile.locale = locale;
//       notifyListeners();
//     }
//   }
// }

// // Local 资源类
// class GmLocalizations {
//   GmLocalizations(this.isZh);

//   // 是否为中文
//   bool isZh = false;
//   // 为了方便，我们定义一个静态方法
//   static GmLocalizations of (BuildContext context) {
//     return Localizations.of<GmLocalizations>(context, GmLocalizations);
//   }
//   // Local相关值，title为应用标题
//   String get apptitle {
//     return isZh ? 'Flutter 应用' : 'Flutter APP';
//   }

//   String get title {
//     return isZh ? '给te哈八' : 'GitHub';
//   }
//   // ......其他的值

//   String get login {
//     return isZh ? '登录' : 'sign in';
//   }

//   String get logout {
//     return isZh ? '退出' : 'logout';
//   }

//   String get noDescription {
//     return isZh ? '暂无描述' : 'no description';
//   }

//   String get logoutTip {
//     return isZh ? '确认退出当前帐号吗？' : 'Are you sure to log out';
//   }

//   String get cancel {
//     return isZh ? '否' : 'no';
//   }

//   String get yes {
//     return isZh ? '是' : 'yes';
//   }

//   String get theme { 
//     return isZh ? 'Theme' : 'theme';
//   }

//   String get language {
//     return isZh ? 'Language' : 'lanuage';
//   }
// }

// // Local 代理类
// class GmLocalizationsDelegate extends LocalizationsDelegate<GmLocalizations> {
//   const GmLocalizationsDelegate();

//   // 是否支持某个Local
//   @override
//   bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

//   // Flutter会调用此类加载相应的Locale资源类
//   @override
//   Future<GmLocalizations> load (Locale locale) {
//     print('xxxx $locale');
//     return SynchronousFuture<GmLocalizations>(
//       GmLocalizations(locale.languageCode == 'zh')
//     );
//   }

//   @override
//   bool shouldReload(GmLocalizationsDelegate old) => false;
// }

// class MyIcons {
//   static const IconData fork = const IconData(
//     0xe623,
//     fontFamily: 'myIcon', 
//     matchTextDirection: true
//   );
// }
