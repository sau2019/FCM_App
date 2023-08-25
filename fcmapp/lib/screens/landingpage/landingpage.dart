import 'package:fcmapp/provider/loginprovider.dart';
import 'package:fcmapp/screens/homescreen/homescreen.dart';
import 'package:fcmapp/screens/loginpage/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<LoginProvider>(context, listen: false).checkUserLogin();
  }

  @override
  Widget build(BuildContext context) {
    var loginObject = context.watch<LoginProvider>();

    return loginObject.isLogin ? HomeScreen() : LoginPage();
  }
}
