import 'package:flash_chat/widget/RoundedButton.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animationTween;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(milliseconds: 1700),
      vsync: this,
    );

    controller.addListener(() {
      setState(() {});
    });
    animationTween = ColorTween(begin: Colors.blue, end: Colors.purple /**/)
        .animate(controller);
    controller.forward();
    animationTween.addStatusListener(
      (status) {
        print("addStatusListener.status " + status.toString());
        if (status == AnimationStatus.completed) {
//        print("AnimationStatus.completed " + status.toString());
          controller.reverse();
        }
        if (status == AnimationStatus.dismissed) {
//        print("AnimationStatus.dismissed " + status.toString());
          controller.forward();
        }
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animationTween.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(),
            ),
            Expanded(
              flex: 10,
              child: Hero(
                tag: "images/logo.png",
                child: Image.asset(
                  'images/logo.png',
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration:
                  kTextFieldDecoration.copyWith(hintText: "Enter your email"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldDecoration.copyWith(
                  hintText: "Enter your password"),
              obscureText: true,
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundedButton(
              text: "Log In",
              color: Colors.lightBlueAccent,
              onPressed: () {},
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
