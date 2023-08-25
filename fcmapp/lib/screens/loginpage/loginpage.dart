import 'package:fcmapp/provider/authprovider.dart';
import 'package:fcmapp/screens/registerpage/registerpage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:fcmapp/screens/landingpage/landingpage.dart';
import 'package:fcmapp/utils/globalwidget.dart';
import 'package:fcmapp/utils/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passShow = false;
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: css.color1.withOpacity(
        0.9,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            height15(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22.0,
                vertical: 5.0,
              ),
              child: Text(
                "Sign In",
                style: GoogleFonts.roboto(
                  color: css.color4,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            height15(),
            height15(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 8.0,
              ),
              child: TextFormField(
                  controller: mobile,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: css.color5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: css.color5.withOpacity(
                          0.5,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: css.color5.withOpacity(
                          0.5,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    errorStyle: TextStyle(
                      color: css.color7,
                      fontSize: 16.0,
                    ),
                    prefixIcon: Icon(
                      LineIcons.lock,
                      color: css.color5,
                      size: 30.0,
                    ),
                    hintText: "Username",
                    hintStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: css.color1.withOpacity(
                          0.3,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          color: css.color5.withOpacity(
                            0.3,
                          )),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    filled: true,
                    fillColor: css.color4,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 8.0,
              ),
              child: TextFormField(
                  controller: password,
                  obscureText: !passShow,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: css.color5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: css.color5.withOpacity(
                          0.5,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: css.color5.withOpacity(
                          0.5,
                        ),
                      ),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    errorStyle: TextStyle(
                      color: css.color7,
                      fontSize: 16.0,
                    ),
                    prefixIcon: Icon(
                      Icons.password,
                      color: css.color5,
                      size: 30.0,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          passShow = !passShow;
                        });
                      },
                      child: Icon(
                        !passShow ? LineIcons.eyeSlash : LineIcons.eye,
                        color: css.color5,
                        size: 30.0,
                      ),
                    ),
                    hintText: "Password",
                    hintStyle: const TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w800,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          color: css.color1.withOpacity(
                            0.3,
                          )),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2,
                          color: css.color5.withOpacity(
                            0.3,
                          )),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.grey.shade200),
                      borderRadius: BorderRadius.circular(
                        20.0,
                      ),
                    ),
                    filled: true,
                    fillColor: css.color4,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (mobile.text.isEmpty) {
                          return showSnackbar(
                              "Username Required", css.color5, context);
                        }

                        if (password.text.isEmpty) {
                          return showSnackbar(
                              "Password Required", css.color5, context);
                        }

                        httpServices
                            .userLogin(
                                username: mobile.text, password: password.text)
                            .then((value) {
                          if (value["status"]) {
                            AuthProvider().signIn(context, value);
                          } else {
                            showSnackbar(
                                "Invalid Credentials", css.color5, context);
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: css.color6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20.0,
                          ),
                        ),
                        elevation: 3.0,
                        disabledBackgroundColor: css.color1,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            color: css.color4,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            height15(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegisterPage()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(
                      color: css.color4,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "Register",
                    style: TextStyle(
                      color: css.color4,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
