import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfunbook/controllers/auth_controller.dart';
import 'package:myfunbook/controllers/inputvalidator.dart';
import 'package:myfunbook/pages/emailverify.dart';
import 'package:myfunbook/pages/homepage.dart';
import 'package:myfunbook/pages/login.dart';
import 'package:myfunbook/pages/signup.dart';
import 'package:myfunbook/utils/social_login_buttons.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class signuppage extends StatefulWidget {
  @override
  _signupstate createState() => _signupstate();
}

class _signupstate extends State<signuppage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pwd = TextEditingController();
  TextEditingController _cnfrmpwd =TextEditingController();

  

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
      /*appBar: AppBar(
        title: Text('login page'),
      ),*/
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Container(
                  height: _size.height,
                  width: _size.width,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 60,
                        width: 180,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: const Text(
                          "Funbook",
                          style: TextStyle(
                              fontSize: 45,
                              fontFamily: "Caveat",
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      
                      const SizedBox(
                        height: 60,
                      ),


                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        padding: const EdgeInsets.all(19),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: _size.width,
                        child: Column(
                          children: [
                            Text(
                              "Create a new account",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  controller: _username,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide.none),
                                      hintText: "Username",
                                      hintStyle: const TextStyle(
                                          color: Colors.black45),
                                      fillColor: Colors.grey.shade300,
                                      filled: true),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 15),
                                child: TextFormField(
                                  controller: _email,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide.none),
                                      hintText: "Email",
                                      hintStyle: const TextStyle(
                                          color: Colors.black45),
                                      fillColor: Colors.grey.shade300,
                                      filled: true),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: _pwd,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide.none),
                                      hintText: "Password",
                                      hintStyle: const TextStyle(
                                          color: Colors.black45),
                                      fillColor: Colors.grey.shade300,
                                      filled: true),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: TextFormField(
                                  obscureText: true,
                                  controller: _cnfrmpwd,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide.none),
                                      hintText: "Confirm Password",
                                      hintStyle: const TextStyle(
                                          color: Colors.black45),
                                      fillColor: Colors.grey.shade300,
                                      filled: true),
                                )),
                            
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (InputValidator.validateField("Name", _username.text.trim()) &&
                            InputValidator.validateField("Email", _email.text.trim())) {
                          if (InputValidator.validatePassword(_pwd.text, _cnfrmpwd.text)) {
                            authcontroller.instance
                                .registeruser(_username.text.trim(),_email.text.trim(), _pwd.text.trim());
                          }
                        }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  "Sign Up",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              )),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Row(
                                children: [
                                  Expanded(child: Divider()),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Text(
                                      "Or",
                                      style: GoogleFonts.poppins(fontSize: 12),
                                    ),
                                  ),
                                  Expanded(child: Divider()),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 15),
                              child: socialloginbuttons(
                                onFbClick: () {},
                                onGoogleClick: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      RichText(

                          text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account?  ",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,textStyle: TextStyle(color: Colors.white)),
                                ),
                        TextSpan(
                            text: "Login Here",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                textStyle: TextStyle(color: Colors.white)),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  (){Get.to(login());},),
                        TextSpan(
                            text: "  here",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,
                                textStyle: TextStyle(color: Colors.white))),
                      ])),
                      /*ElevatedButton(
                          onPressed: () => _opensignuppage(context: context),
                          child: Text("Sign up")),*/
                    ],
                  )))),
    );
  }

  void _opensignuppage(
      {required BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => emailverify(),
          fullscreenDialog: fullscreenDialog),
    );
  }
}

String? validateemail(String email) {
  if (email.isEmpty) {
    return "please enter your email id";
  } else {
    return null;
  }
}

String? validatepwd(String pwd) {
  if (pwd.isEmpty) {
    return "password required";
  } else {
    return null;
  }
}
