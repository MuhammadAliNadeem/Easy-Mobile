import 'package:easymobile/Constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget textField({
  required BuildContext context,
  required var hint,
  IconData? icon,
  required var lable,
  required TextEditingController controller,
  TextInputType? inputType,
  dynamic obscureText,
}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: SizedBox(
      height: 45,
      width: width * 0.8,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "Field is required";
          } else {
            return null;
          }
        },
        keyboardType: inputType ?? TextInputType.emailAddress,
        style: TextStyle(color: primaryClr, fontSize: 14),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: primaryClr,
            size: 20,
          ),
          labelText: "$lable",
          labelStyle: TextStyle(color: primaryClr, fontSize: 14),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryClr),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryClr),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryClr),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          hintText: "$hint",
          hintStyle: TextStyle(fontSize: 14, color: primaryClr),
        ),
      ),
    ),
  );
}

Widget productField({
  required BuildContext context,
  required var hint,
  required var lable,
  required TextEditingController controller,
  TextInputType? inputType,
}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: SizedBox(
      height: 45,
      width: width * 0.8,
      child: TextFormField(
        controller: controller,
        style: TextStyle(color: primaryClr, fontSize: 14),
        decoration: InputDecoration(
          // prefixIcon: Icon(icon,color: primaryClr,size: 20,),
          labelText: "$lable",
          labelStyle: TextStyle(color: primaryClr, fontSize: 14),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryClr),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryClr),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryClr),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          hintText: "$hint",
          hintStyle: TextStyle(fontSize: 14, color: primaryClr),
        ),
      ),
    ),
  );
}

Widget descriptionField({
  required BuildContext context,
  required var hint,
  required var lable,
  required TextEditingController controller,
  TextInputType? inputType,
}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: SizedBox(
      // height: 45,
      width: width * 0.8,
      child: TextFormField(
        controller: controller,
        maxLines: 5,
        style: TextStyle(color: primaryClr, fontSize: 14),
        decoration: InputDecoration(
          // prefixIcon: Icon(icon,color: primaryClr,size: 20,),
          labelText: "$lable",
          labelStyle: TextStyle(color: primaryClr, fontSize: 14),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryClr),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryClr),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryClr),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          hintText: "$hint",
          alignLabelWithHint: true,
          hintStyle: TextStyle(fontSize: 14, color: primaryClr),
        ),
      ),
    ),
  );
}

bool isVisible = true;

class passwordfield extends StatefulWidget {
  passwordfield(
      {Key? key,
      required this.controller,
      required this.hint,
      required this.lable})
      : super(key: key);
  TextEditingController? controller;
  var hint;
  var lable;

  @override
  State<passwordfield> createState() => _passwordfieldState();
}

class _passwordfieldState extends State<passwordfield> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 45,
        width: width * 0.8,
        child: TextFormField(
          controller: widget.controller,
          // keyboardType: TextInputType.number,
          // validator: (value) {
          //   if (value!.isEmpty) {
          //     return "Field is required";
          //   } else {
          //     return null;
          //   }
          // },
          style: TextStyle(color: primaryClr, fontSize: 14),
          decoration: InputDecoration(
            prefixIcon: Icon(
              CupertinoIcons.lock,
              color: primaryClr,
              size: 20,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                  print(isVisible);
                });
              },
              icon: Icon(
                isVisible == false ? Icons.visibility : Icons.visibility_off,
                color: primaryClr,
                size: 20,
              ),
            ),
            labelText: "${widget.lable}",
            labelStyle: TextStyle(color: primaryClr, fontSize: 14),
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryClr),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryClr),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryClr),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            hintText: "${widget.hint}",
            hintStyle: TextStyle(fontSize: 14, color: primaryClr),
          ),
          obscureText: isVisible,
        ),
      ),
    );
  }
}

//============================ Conform password ==================

bool isConfirmVisible = true;

class cpasswordfield extends StatefulWidget {
  cpasswordfield({
    Key? key,
    required this.controller,
  }) : super(key: key);
  TextEditingController? controller;
  @override
  State<cpasswordfield> createState() => _cpasswordfieldState();
}

class _cpasswordfieldState extends State<cpasswordfield> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        height: 45,
        width: width * 0.8,
        child: TextFormField(
          controller: widget.controller,
          // keyboardType: TextInputType.number,
          validator: (value) {
            if (value!.isEmpty) {
              return "Field is required";
            } else {
              return null;
            }
          },
          style: TextStyle(color: primaryClr, fontSize: 14),
          decoration: InputDecoration(
            prefixIcon: Icon(
              CupertinoIcons.lock,
              color: primaryClr,
              size: 20,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isConfirmVisible = !isConfirmVisible;
                  print(isConfirmVisible);
                });
              },
              icon: Icon(
                isConfirmVisible == false
                    ? Icons.visibility
                    : Icons.visibility_off,
                color: primaryClr,
                size: 20,
              ),
            ),
            labelText: "Confirm Password",
            labelStyle: TextStyle(color: primaryClr, fontSize: 14),
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryClr),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryClr),
              borderRadius: const BorderRadius.all(const Radius.circular(8)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryClr),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 12,
            ),
            hintText: "Confirm Password",
            hintStyle: TextStyle(fontSize: 14, color: primaryClr),
          ),
          obscureText: isConfirmVisible,
        ),
      ),
    );
  }
}

Widget textFieldEmail({
  required BuildContext context,
  required var hint,
  IconData? icon,
  required var lable,
  required TextEditingController controller,
  TextInputType? inputType,
  dynamic obscureText,
}) {
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: SizedBox(
      height: 45,
      width: width * 0.8,
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value!.isValidEmail) {
            return null;
          } else {
            return "Please enter a valid email";
          }
        },
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(color: primaryClr, fontSize: 14),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: primaryClr,
            size: 20,
          ),
          labelText: "$lable",
          labelStyle: TextStyle(color: primaryClr, fontSize: 14),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryClr),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryClr),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: primaryClr),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
          hintText: "$hint",
          hintStyle: TextStyle(fontSize: 14, color: primaryClr),
        ),
      ),
    ),
  );
}

extension extString on String {
  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidUserName {
    final nameRegExp = new RegExp(r"^[a-zA-Z0-9.]");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = new RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
    return phoneRegExp.hasMatch(this);
  }
}
