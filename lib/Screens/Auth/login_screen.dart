import 'dart:async';
import 'package:easymobile/Constants/colors.dart';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Screens/Auth/email_verification_screen.dart';
import 'package:easymobile/Screens/Auth/reset_password_screen.dart';
import 'package:easymobile/Screens/Auth/signup_screen.dart';
import 'package:easymobile/Screens/Bottom%20Navbar/navigation_bar.dart';
import 'package:easymobile/Screens/Home/home_screen.dart';
import 'package:easymobile/Widgets/app_bar.dart';
import 'package:easymobile/Widgets/buttons.dart';
import 'package:easymobile/Widgets/flush_bar.dart';
import 'package:easymobile/Widgets/text_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool isTermsConditions = false;
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Consumer<AuthProvider>(
      builder: (context, value, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: appBar(title: "Login"),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      textFieldEmail(
                        context: context,
                        lable: "Email",
                        hint: "Email",
                        icon: CupertinoIcons.mail,
                        controller: email,
                        inputType: TextInputType.emailAddress,
                      ),
                      passwordfield(
                          controller: password,
                          hint: "Password",
                          lable: "Password"),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ResetPasswordScreen()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forgot Password?",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    fontSize: 13,
                                    color: primaryClr,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: height * 0.08,
                      ),
                      loadingButton(
                          context: context,
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              value.isEmailVerified
                                  ? await value
                                      .loginUser(email.text, password.text)
                                      .then((value12) async {
                                      if (value.isUserLoggedIn) {
                                        await value.mGetUser();
                                        _btnController.success();
                                        SuccessFlushbar(context, 'Login in',
                                            "${value.userLoginMessage}");
                                        Timer(const Duration(seconds: 2), () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const NavigationBarScreen()));
                                          _btnController.reset();
                                        });
                                      } else {
                                        SuccessFlushbar(context, 'Login in',
                                            "${value.userLoginMessage}");
                                        _btnController.error();
                                        Timer(const Duration(seconds: 2), () {
                                          _btnController.reset();
                                        });
                                      }
                                    })
                                  : showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text(
                                              "Alert",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            content: SizedBox(
                                              height: height * 0.05,
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "Please verify your email to continue",
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 15),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);

                                                    _btnController.error();
                                                    Timer(
                                                        const Duration(
                                                            milliseconds: 700),
                                                        () {
                                                      _btnController.reset();
                                                    });
                                                  },
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        color: primaryClr,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                              TextButton(
                                                  onPressed: () async {
                                                    Navigator.pop(context);
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const EmailVerificationScreen()));
                                                  },
                                                  child: Text(
                                                    "Verify",
                                                    style: TextStyle(
                                                        color: primaryClr,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                            ],
                                          ));
                            } else {}
                          },
                          text: "Login",
                          width: width,
                          btnController: _btnController),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignupScreen()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 10),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.grey, fontSize: 13)),
                  TextSpan(
                      text: "SignUp",
                      style: TextStyle(
                          color: primaryClr,
                          fontWeight: FontWeight.bold,
                          fontSize: 14)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
