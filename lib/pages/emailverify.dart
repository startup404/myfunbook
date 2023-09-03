import 'package:flutter/material.dart';
import 'package:myfunbook/pages/signup.dart';
import 'package:random_string/random_string.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class emailverify extends StatefulWidget {
  @override
  _emailstate createState() => _emailstate();
}

String generateOTP() {
  return randomNumeric(6);
}

class _emailstate extends State<emailverify> {
  TextEditingController _email = TextEditingController();
  TextEditingController _otp = TextEditingController();

  String otp = generateOTP();
  Future<void> sendOTP() async {
    final Email emailmessage = Email(
        body: 'your OTP code is : $otp',
        isHTML: false,
        recipients: [_email.text],
        subject:
            "Hi we are glad you are willing to join funcorp. We are looking forward for your feedback.Here is the OTP for verification.");
    await FlutterEmailSender.send(emailmessage);
  }

  void verifyOTP() {
    if (otp == _otp.text) {
      print("verified");
    } else {
      print("incorrect OTP");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify Email"),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                    labelText: "Email",
                    suffixIcon: TextButton(
                      child: Text("send"),
                      onPressed: () => sendOTP(),
                    )),
              ),
              SizedBox(
                height: 16.0,
              ),
              TextFormField(
                controller: _otp,
                decoration: InputDecoration(labelText: "OTP"),
                obscureText: true,
              ),
              SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                  onPressed: () => verifyOTP(), child: Text("Verify OTP"))
            ],
          ),
        ),
      )),
    );
  }
}
