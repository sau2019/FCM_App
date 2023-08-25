import 'package:fcmapp/screens/landingpage/landingpage.dart';
import 'package:fcmapp/services/sharedpref.dart';
import 'package:fcmapp/utils/globalwidget.dart';
import 'package:flutter/material.dart';

class AuthProvider {
  SharePref sharedPref = SharePref();
  signOut(BuildContext context) async {
    showSnackbar("Hold on while log out...", css.color5, context);
    sharedPref.setAccountPreferences("", false);
    showSnackbar("log out successfully.", css.color6, context);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LandingPage()));
  }

  signIn(BuildContext context, var value) {
    sharedPref.setAccountPreferences(value["data"][0], true);
    showSnackbar("You have been login successfully.", css.color6, context);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LandingPage()));
  }
}
