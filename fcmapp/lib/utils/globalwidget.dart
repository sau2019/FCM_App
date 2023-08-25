import 'dart:math';
import 'package:fcmapp/model/userinfo.dart';
import 'package:fcmapp/services/httpservice.dart';
import 'package:fcmapp/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

GlobalStyle css = GlobalStyle();
HttpServices httpServices = HttpServices();
UserInfo? userInfo;

height15() {
  return SizedBox(
    height: 15,
  );
}

showSnackbar(var message, var color, BuildContext context) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: color,
  ));
}

Widget inkWell(IconData icon, void Function()? onTap, Color color) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(
        50.0,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 25.0,
          color: color,
        ),
      ),
    ),
  );
}

AppBar customAppBar(
    void Function()? backTap, var title, List<Widget>? actions) {
  return AppBar(
    leading: Tooltip(
      message: "Back",
      child: inkWell(
        Icons.arrow_back,
        backTap,
        Colors.white,
      ),
    ),
    elevation: 0.1,
    backgroundColor: css.color1,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: css.color4,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
    actions: actions,
  );
}

Widget textFieldWidget(TextEditingController textEditingController, var label,
    IconData? icons, TextInputType textInputType, bool readonly) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 15.0,
    ),
    child: TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      enabled: !readonly,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 1.0,
          ),
          labelText: label,
          labelStyle: TextStyle(
            color: css.color1,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: css.color2),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: css.color2),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(
              10.0,
            ),
          ),
          filled: true,
          prefixIcon: icons != null
              ? Icon(
                  icons,
                  color: css.color1,
                  size: 25,
                )
              : null,
          fillColor: css.color4.withOpacity(
            0.8,
          )),
    ),
  );
}
