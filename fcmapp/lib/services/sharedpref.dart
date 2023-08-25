// import 'dart:convert';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  setAccountPreferences(var data, bool islogin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String udata = jsonEncode(data);
    prefs.setString("data", udata);
    prefs.setBool("islogin", islogin);
  }

  Future getAccountPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var val = prefs.getString("data");
    return val;
  }

  Future<bool?> checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? val = prefs.getBool("islogin");
    return val;
  }
}
