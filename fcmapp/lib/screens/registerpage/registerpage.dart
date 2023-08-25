import 'package:fcmapp/utils/globalwidget.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool btnClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: css.color2,
      appBar: customAppBar(() {
        Navigator.pop(context);
      }, "Registration Form", []),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height15(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 5.0,
              ),
              child: Text(
                "Enter your Name",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            textFieldWidget(name, "", null, TextInputType.text, false),
            height15(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 5.0,
              ),
              child: Text(
                "Mobile No",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            textFieldWidget(
                mobile, "", LineIcons.mobilePhone, TextInputType.number, false),
            height15(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 5.0,
              ),
              child: Text(
                "Email Id (Optional)",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            textFieldWidget(email, "", Icons.email_outlined,
                TextInputType.emailAddress, false),
            height15(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 5.0,
              ),
              child: Text(
                "Password",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            textFieldWidget(
                password, "", Icons.password, TextInputType.text, false),
            height15(),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                "Note: Mobile No. will become your username",
                style: TextStyle(
                  color: css.color7,
                  fontSize: 14.0,
                ),
              ),
            ),
            height15(),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: btnClicked
                          ? null
                          : () async {
                              if (name.text.isEmpty) {
                                return showSnackbar(
                                    "Name Required", css.color5, context);
                              }

                              if (mobile.text.isEmpty) {
                                return showSnackbar(
                                    "Mobile No. Required", css.color5, context);
                              }
                              if (mobile.text.length != 10) {
                                return showSnackbar(
                                    "Kindly enter 10 digit mobile no.",
                                    css.color5,
                                    context);
                              }

                              if (password.text.isEmpty) {
                                return showSnackbar("Choose your password",
                                    css.color5, context);
                              }
                              if (password.text.length < 5) {
                                return showSnackbar(
                                    "Choose your password min 5 character long",
                                    css.color5,
                                    context);
                              }

                              submitData();
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
                          "Register",
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
          ],
        ),
      ),
    );
  }

  submitData() {
    setState(() {
      btnClicked = true;
    });
    showSnackbar("Submitting data....", css.color5, context);
    httpServices
        .registerUser(
            name: name.text,
            mobile: mobile.text,
            email: email.text,
            password: password.text)
        .then((value) {
      if (value["status"]) {
        showSnackbar(
            "Registration Completed Successfully.", css.color6, context);

        Navigator.pop(context);
      } else {
        showSnackbar(value["message"], css.color5, context);
        setState(() {
          btnClicked = false;
        });
      }
    });
  }
}
