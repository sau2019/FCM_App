import 'dart:convert';
import 'package:fcmapp/model/userinfo.dart';
import 'package:fcmapp/services/sharedpref.dart';
import 'package:fcmapp/utils/globalwidget.dart';
import 'package:flutter/foundation.dart';

class LoginProvider with ChangeNotifier {
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  SharePref sharedPref = SharePref();

  checkUserLogin() {
    sharedPref.checkLogin().then((value) {
      if (value != null) {
        _isLogin = value;
      }

      if (_isLogin) {
        sharedPref.getAccountPreferences().then((value) {
          userInfo = UserInfo.fromJson(jsonDecode(value));
        });
      }

      notifyListeners();
    });
  }
}
