import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/LoginScreen/signupscreen.dart';
import 'package:flutter_ui/Pages.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late FirebaseAuth auth;
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void initState() {
    auth = FirebaseAuth.instance;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: ExactAssetImage("assets/forest3.jpg"),
                  fit: BoxFit.cover),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    controller: mailController,
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
                    obscureText: true,
                    controller: passwordController,
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
                TextButton(
                  onPressed: () {
                    FirebaseAuth.instance
                        .sendPasswordResetEmail(email: mailController.text);
                  },
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.white),
                  ),
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
                    child: Text('Login'),
                    onPressed: () {
                      loginEmailAndPasswd();
                    },
                  ),
                ),
                Row(
                  children: <Widget>[
                    TextButton(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignUpScreen()));
                      },
                    )
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: AnimatedTextKit(
                    repeatForever: true,
                    pause: Duration(milliseconds: 50),
                    animatedTexts: [
                      RotateAnimatedText("WELCOME",
                          textStyle:
                              TextStyle(fontSize: 30, color: Colors.white)),
                      RotateAnimatedText("TO",
                          textStyle:
                              TextStyle(fontSize: 30, color: Colors.white)),
                      RotateAnimatedText("APP",
                          textStyle:
                              TextStyle(fontSize: 30, color: Colors.white)),
                    ],
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
    var _userCredential = await auth.createUserWithEmailAndPassword(
        email: mailController.text, password: passwordController.text);
  }

  Future<void> loginEmailAndPasswd() async {
    var _userCredential = await auth.signInWithEmailAndPassword(
        email: mailController.text, password: passwordController.text);
  }
}
