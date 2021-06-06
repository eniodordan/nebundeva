import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

import 'widgets/add_player_button.dart';
import 'package:nebundeva/widgets/action_button.dart';
import 'package:nebundeva/screens/mode_screen/mode_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<String> playersList = ['', ''];
  bool isButtonVisible = true;

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom / 2;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              reverse: true,
              padding: EdgeInsets.fromLTRB(50, 65, 50, 65 + bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
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
                  SizedBox(height: 25),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Tko igra?',
                          style: TextStyle(fontSize: 36),
                        ),
                      ),
                      ..._getTextFields(),
                      Visibility(
                        visible: isButtonVisible,
                        child: AddPlayerButton(
                          onPressed: () {
                            if (playersList.length < 4) {
                              setState(() {
                                playersList.add('');
                                if (playersList.length == 4) {
                                  isButtonVisible = false;
                                }
                              });
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 25),
                  ActionButton(
                    buttonText: 'Započni',
                    textColour: kBackgroundColour,
                    buttonColour: Colors.white,
                    onPressed: () {
                      List<String> players = [];

                      playersList.forEach((playerName) {
                        if (playerName.trim().isNotEmpty) {
                          players.add(playerName.trim());
                        }
                      });

                      if (players.length >= 2) {
                        Navigator.pushNamed(context, ModeScreen.id,
                            arguments: players);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Container(
                              height: 50,
                              child: Text(
                                'Potrebna su najmanje 2 igrača',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'BebasNeue',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            backgroundColor: kRedColour,
                          ),
                        );
                      }
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

  List<Widget> _getTextFields() {
    List<Widget> playersTextFields = [];

    for (int i = 0; i < playersList.length; i++) {
      playersTextFields.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Container(
            height: 60,
            child: PlayerTextField(i),
          ),
        ),
      );
    }

    return playersTextFields;
  }
}

class PlayerTextField extends StatefulWidget {
  final int index;

  PlayerTextField(this.index);

  @override
  _PlayerTextFieldState createState() => _PlayerTextFieldState();
}

class _PlayerTextFieldState extends State<PlayerTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => _HomeScreenState.playersList[widget.index] = value,
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
    );
  }
}
