import 'dart:async';
import 'package:easymobile/Provider/authProvider.dart';
import 'package:easymobile/Widgets/buttons.dart';
import 'package:easymobile/Widgets/flush_bar.dart';
import 'package:easymobile/Widgets/text_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../constants/colors.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPasswordScreen> {
  TextEditingController email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController _btnController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Consumer<AuthProvider>(
      builder: (
        context,
        provider,
        child,
      ) =>
          Scaffold(
        // backgroundColor: Colors.white,
        // resizeToAvoidBottomInset: false,
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
          ),
          elevation: 0,
          backgroundColor: primaryClr,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: height * 0.07,
                  width: width,
                  decoration: BoxDecoration(
                  color: primaryClr,
                   borderRadius: const BorderRadius.only(bottomRight: Radius.circular(70)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Enter your email address to reset password",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              textField(
                context: context,
                lable: "Email",
                hint: "Email",
                icon: CupertinoIcons.mail,
                controller: email,
                inputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
              loadingButton(
                  context: context,
                  onPressed: () async {
                    if (email.text.isNotEmpty) {
                      String emails = email.text;
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emails)
                          .then((value) {
                        showAlertDialog(context);
                        SuccessFlushbar(context, "Info",
                            "Check your email to reset password!");
                        _btnController.success();
                        Timer(const Duration(milliseconds: 700), () {
                          _btnController.reset();
                        });
                        email.clear();
                      });
                    } else {
                      _btnController.error();
                      ErrorFlushbar(context, "Error", "Something went wrong!");
                      Timer(const Duration(milliseconds: 700), () {
                        _btnController.reset();
                      });
                    }
                  },
                  text: "Send me email",
                  width: width,
                  btnController: _btnController),
            ],
          ),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}
