import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfunbook/controllers/auth_controller.dart';
import 'package:myfunbook/pages/emailverify.dart';
import 'package:myfunbook/pages/homepage.dart';
import 'package:myfunbook/pages/signup.dart';
import 'package:myfunbook/utils/social_login_buttons.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class login extends StatefulWidget {
  @override
  _loginstate createState() => _loginstate();
}

class _loginstate extends State<login> {
  TextEditingController _email = TextEditingController();//controller for imputting email.
  TextEditingController _pwd = TextEditingController();//controller for imputting password.
  TextEditingController _cnfrmemail = TextEditingController(); //controller for inputting email in forgot password dialog box.

  Future<void> fetchfromspreadsheet() async {
    try {
      String apiurl =
          'https://script.google.com/macros/s/AKfycbxCmOp0O5qWq9q9J25z1IGMKVSE_Uk7wbbh3ue1JrUon4U1lURi3wVj17f--srHliXOrw/exec?action=doGet';

      var response = await http.get(Uri.parse(apiurl));

      var decoded = jsonDecode(response.body);
      Map<String, dynamic> usermap = decoded;
      List data = usermap["data"];
      Map<String, String> datamap = new Map();
      for (int i = 1; i < data.length; i++) {
        datamap[data[i][0]] = data[i][1];
      }
      /*datamap.forEach((key, value) {
        print("$key - $value");
      });*/

      //print(datamap["sai1"]);
      String email = _email.text;
      String pwd = _pwd.text;
      if (datamap[email] == pwd) {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => homepage()));
      } //navigate to main page
      else if (datamap[email] == null) {
      } //show that the email is not registered.
      else if (datamap[email] != null &&
          datamap[email] != pwd) {} //show that password entered is wrong.

      //print(data);
    } catch (e) {
      print(e);
    }
  }

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
                        height: 15,
                      ),
                      Text(
                        "Welcome buddies",
                        style: GoogleFonts.poppins(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 22)),
                      ),
                      Text(
                        "Login to explore, I say it's your time to have fun",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontSize: 14)),
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
                              "Login to your account",
                              style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
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
                                  validator: (value) => validateemail(value!),
                                  autovalidateMode: AutovalidateMode.always,
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
                                  validator: (value) => validatepwd(value!),
                                  autovalidateMode: AutovalidateMode.always,
                                )),

//Forgot password Section.
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Get.defaultDialog(
                                    backgroundColor: Colors.white,
                                    titleStyle: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                                    title:"Forgot password?",
                                    content: TextFormField(
                                      controller: _cnfrmemail,
                                      style: const TextStyle(color: Colors.black),
                                      decoration: InputDecoration(

                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: BorderSide.none),
                                      hintText: "Email Address",
                                      hintStyle: const TextStyle(
                                          color: Colors.black45),
                                      fillColor: Colors.grey.shade300,
                                      filled: true),
                                    ),
                                    radius: 10,
                                    onWillPop: (){
                                      _cnfrmemail.text="";
                                      return Future.value(true);
                                    },
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    confirm: ElevatedButton(onPressed:(){authcontroller.instance.forgotpassword(_cnfrmemail.text.trim());
                                    _cnfrmemail.text="";
                                    Get.back();
                                    },
                                    style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  "Send Reset Email",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400),
                                ),
                              )),)

                                  );
            
                                },
                                child: Text(
                                  'forgot password?',
                                  style: GoogleFonts.nunitoSans(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),

                            const SizedBox(
                              height: 10,
                            ),

//Login button
                            ElevatedButton(
                              onPressed: (){authcontroller.instance.loginuser(_email.text.trim(),_pwd.text.trim());},
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.all(12),
                                child: Text(
                                  "Log in",
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
                                onGoogleClick: () {
                                  authcontroller.instance.googlelogin();
                                },
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
                            text: "Don't have an account?  ",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w700,textStyle: TextStyle(color: Colors.white)),
                                ),
                        TextSpan(
                            text: "Sign up",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                textStyle: TextStyle(color: Colors.white)),
                            recognizer: TapGestureRecognizer()
                              ..onTap =
                                  (){Get.to(signuppage());},),
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
