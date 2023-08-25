import 'dart:io';
import 'package:fcmapp/utils/utils.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class HttpServices {
  Future<dynamic> userLogin(
      {required String username, required String password}) async {
    try {
      var response = await http.get(Uri.parse(
          "${baseApiUrl}userlogin/$username/$password?apikey=$apiKey"));

      var result = json.decode(response.body);
      return result;
    } catch (e) {
      return e.toString();
    }
  }

  Future<dynamic> registerUser(
      {required String name,
      required String mobile,
      required String email,
      required String password}) async {
    try {
      var response = await http
          .post(Uri.parse("${baseApiUrl}registeruser?apikey=$apiKey"), body: {
        "name": name,
        "mobile": mobile,
        "email": email,
        "password": password,
      });

      var result = json.decode(response.body);
      return result;
    } catch (e) {
      return e.toString();
    }
  }
}
