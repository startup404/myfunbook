import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:myfunbook/pages/homepage.dart';
import 'package:myfunbook/pages/login.dart';

class authcontroller extends GetxController{
  static authcontroller instance = Get.find();
  late Rx<User?> _user;
  bool islogging=false;

  final FirebaseAuth auth = FirebaseAuth.instance;
  final dataref = FirebaseDatabase.instance.ref("User Details");

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.authStateChanges());

    ever(_user,loginredirect);

  }

  loginredirect ( User? user )
  {
    Timer(Duration(seconds: islogging ? 0 : 2), () {
      if (user == null) {
        islogging = false;
        update();
        Get.offAll(() => login());
      } else {
        islogging = true;
        update();
        Get.offAll(() => homepage());
      }
    });
  }

  void registeruser(user,email,password) async{
    islogging=true;
    try{
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      dataref.child(email.split('@')[0].toString()).set({
        "Username": user ,
        "email": email ,
        "mobile": "No Phonenumber"});        
      
    }on FirebaseAuthException catch(e){
      //define error
      geterrorsnackbar("Account Creating Failed",e );
    }
  }

  void loginuser(email,password) async{
    islogging=true;
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      //define error
      geterrorsnackbar("Login Failed",e );
    }
  }

  void googlelogin()async {
    final GoogleSignIn googlesignin = GoogleSignIn();
    islogging = true;
    update();

    try{
      googlesignin.disconnect();
    }
    catch(e){}

    try{
    final GoogleSignInAccount? googleSignInAccount = await googlesignin.signIn();
    if(googleSignInAccount !=null)
    {
      final GoogleSignInAuthentication? googleauth = await googleSignInAccount.authentication;
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleauth?.accessToken,
        idToken: googleauth?.idToken
      );
      await auth.signInWithCredential(credentials);

    }}
    on FirebaseAuthException catch(e){
      geterrorsnackbar("Google Login Failed", e);
    }
  }

  void forgotpassword(email)async {
    try{
      await auth.sendPasswordResetEmail(email: email);
      getsuccesssnackbar("Reset Email Sent Successfully, Please Check Your Email!");
    }
    on FirebaseAuthException catch(e){
      geterrorsnackbar("Error", e);

    }
  }

  geterrorsnackbar(String message, _){
    Get.snackbar("Error", "$message\n${_.message}",
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.black,
    borderRadius: 10,
    margin: EdgeInsets.only(bottom: 10,left: 10,right: 10));
  }

  getsuccesssnackbar(String message){
    Get.snackbar("Success", message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.green,
    colorText: Colors.black,
    borderRadius: 10,
    margin: EdgeInsets.only(bottom: 10,left: 10,right: 10));
  }

  void signout() async{
    await auth.signOut();
  }

}