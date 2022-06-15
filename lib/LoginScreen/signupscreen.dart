import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'loginscreen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var crtMail = TextEditingController();
  var crtPasswd = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("assets/signup.jpeg"),
                  fit: BoxFit.cover),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: crtMail,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: Color.fromARGB(83, 255, 255, 255),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    controller: crtPasswd,
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.transparent),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(15)),
                        filled: true,
                        fillColor: Color.fromARGB(83, 255, 255, 255),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromARGB(83, 255, 255, 255),
                      ),
                    ),
                    child: Text('Sign Up'),
                    onPressed: () async {
                      await createEmailAndPasswd();
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createEmailAndPasswd() async {
    var _userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: crtMail.text, password: crtPasswd.text);
  }
}
