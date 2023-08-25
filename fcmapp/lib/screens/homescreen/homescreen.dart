import 'package:fcmapp/provider/authprovider.dart';
import 'package:fcmapp/utils/globalwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: css.color2,
      appBar: AppBar(
        backgroundColor: css.color1,
        automaticallyImplyLeading: false,
        title: Text(
          "FCM App",
          style: TextStyle(
            color: css.color4,
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          Tooltip(
            message: "Logout",
            child: inkWell(
              Icons.logout,
              () {
                AuthProvider().signOut(context);
              },
              css.color4,
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height15(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            child: Text(
              "Hello, ${userInfo!.name}",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            child: Text(
              "Mob No.: +91${userInfo!.mobileNo}",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15.0,
              vertical: 5.0,
            ),
            child: Text(
              "Email: ${userInfo!.email}",
              style: TextStyle(
                color: Colors.black87,
                fontSize: 16.0,
                fontWeight: FontWeight.w800,
              ),
            ),
          )
        ],
      ),
    );
  }
}
