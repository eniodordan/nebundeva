import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

import 'package:nebundeva/screens/mode_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isInputVisible = [true, false, false, false];
  bool isButtonVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '(NE) ',
                    style: TextStyle(
                      color: kRedColour,
                      fontSize: 44,
                    ),
                  ),
                  Text(
                    'BUNDEVA',
                    style: TextStyle(
                      color: kGreenColour,
                      fontSize: 44,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Tko igra?',
                      style: TextStyle(fontSize: 36),
                    ),
                  ),
                  PlayerTextField(isVisible: isInputVisible[0]),
                  PlayerTextField(isVisible: isInputVisible[1]),
                  PlayerTextField(isVisible: isInputVisible[2]),
                  PlayerTextField(isVisible: isInputVisible[3]),
                  AddPlayerButton(
                    isVisible: isButtonVisible,
                    onPressed: () {
                      int i = 0;
                      while (isInputVisible[i]) i++;

                      setState(() {
                        isInputVisible[i] = true;

                        if (i == isInputVisible.length - 1) {
                          isButtonVisible = false;
                        }
                      });
                    },
                  ),
                ],
              ),
              StartButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class PlayerTextField extends StatelessWidget {
  final bool isVisible;

  PlayerTextField({required this.isVisible});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Container(
          height: 60,
          child: TextField(
            style: TextStyle(fontSize: 24),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              filled: true,
              fillColor: kDarkGreyColour,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 15),
            ),
          ),
        ),
      ),
    );
  }
}

class AddPlayerButton extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onPressed;

  const AddPlayerButton({required this.isVisible, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 75),
        child: Container(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            child: Text(
              'Dodaj igrača +',
              style: TextStyle(
                color: kBackgroundColour,
                fontSize: 16,
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF9A9AA1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}

class StartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          child: Text(
            'Započni',
            style: TextStyle(
              color: kBackgroundColour,
              fontSize: 24,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, ModeScreen.id);
          },
        ),
      ),
    );
  }
}
