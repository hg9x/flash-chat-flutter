import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flash_chat/widget/RoundedButton.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  Animation animationTween;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 1700),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animationTween =
        ColorTween(begin: Colors.yellow, end: Colors.green).animate(controller);
    controller.forward();
    animation.addStatusListener((status) {
      print("addStatusListener.status " + status.toString());
      if (status == AnimationStatus.completed) {
//        print("AnimationStatus.completed " + status.toString());
        controller.reverse();
      }
      if (status == AnimationStatus.dismissed) {
//        print("AnimationStatus.dismissed " + status.toString());
        controller.forward();
      }
    });
    controller.addListener(() {
      setState(() {});
//      print(controller.value);
    });
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
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Hero(
                      tag: "images/logo.png",
                      child: Container(
                        child: Image.asset('images/logo.png'),
                        height: 30 + 60.0 * (animation.value),
                      ),
                    ),
                  ),
                  Text(
                    'Flash Chat ${(animation.value * 100).toInt()} %',
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            RoundedButton(
              text: "Log In",
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              text: "Register",
              color: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
//                    if (animation.status == AnimationStatus.completed)
//                      controller.reverse(from: 0.5);
//                    if (animation.status == AnimationStatus.dismissed) {
//                      controller.forward();
//                    }

                    print("animation.status ${animation.status}");
                    print("animation.isCompleted ${animation.isCompleted}");
                    print("controller.isDismissed ${controller.isDismissed}");
                    print("controller.status ${controller.status}");
                    print("controller.isDismissed ${controller.isDismissed}");
                    print("controller.isCompleted ${controller.isCompleted}");
                    print("controller.isAnimating ${controller.isAnimating}");
                    if (controller.isAnimating)
                      controller.stop();
                    else
                      controller.forward();
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Reset Controller',
                  ),
                ),
              ),
            ),
            LinearProgressIndicator(
              value: animation.value,
            ),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}
