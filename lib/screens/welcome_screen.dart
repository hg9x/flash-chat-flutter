import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
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

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
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
      backgroundColor: Colors.amber,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: "images/logo.png",
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0 * (animation.value),
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
            SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    //Go to login screen.
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                  ),
                ),
              ),
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
          ],
        ),
      ),
    );
  }
}
