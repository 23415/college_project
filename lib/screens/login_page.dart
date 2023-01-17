import 'package:amc_canteen/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'otp_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  static String verifyId = '';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  String phoneno = '';
  bool buttonname = false;

  final _keyForm = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_keyForm.currentState!.validate()) {
      setState(() {
        buttonname = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, Routes.homeroutes);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              SingleChildScrollView(
                child: Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Text(
                          'AMC Canteen',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Image.asset("assets/undraw_breakfast_psiw.png"),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "WELCOME $name",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Enter Your Name",
                              labelText: "Name"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "username cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;

                            setState(() {});
                          }),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Enter Your Phone Number",
                          labelText: "Phone Number",
                        ),
                        onChanged: (value) {
                          setState(() {
                            phoneno = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "password cannot be empty";
                          } else if (value.length < 6) {
                            return "password should be atleast 6";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: '${"+91$phoneno"}',
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                LoginPage.verifyId = verificationId;
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => OtpPage())));
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                          },
                          child: Text("Send OTP")),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
