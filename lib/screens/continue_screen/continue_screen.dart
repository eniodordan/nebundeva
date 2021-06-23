import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

import 'package:nebundeva/widgets/action_button.dart';
import 'package:nebundeva/screens/home_screen/home_screen.dart';

class ContinueScreen extends StatelessWidget {
  static const String id = 'continue_screen';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/logo.png',
                    width: 100.0,
                  ),
                  SizedBox(height: 75),
                  ActionButton(
                    buttonText: 'Nastavi igru',
                    textColour: kBackgroundColour,
                    buttonColour: Color(0xFF9A9AA1),
                    onPressed: () {},
                  ),
                  ActionButton(
                    buttonText: 'Započni novu igru',
                    textColour: kBackgroundColour,
                    buttonColour: Colors.white,
                    onPressed: () {
                      Navigator.popAndPushNamed(context, HomeScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
