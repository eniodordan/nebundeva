import 'package:flutter/material.dart';
import 'package:nebundeva/widgets/player_text_field.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> isVisible = [true, false, false, false];
  List<String> players = ['', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '(NE)BUNDEVA',
                style: TextStyle(
                  fontSize: 21.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    'TKO IGRA?',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 25),
                  PlayerTextField(
                    fieldId: 0,
                    isVisible: isVisible[0],
                    onChanged: (text) {
                      players[0] = text;
                      setState(() {
                        if (!isVisible[1]) {
                          isVisible[1] = true;
                        }
                      });
                    },
                  ),
                  PlayerTextField(
                    fieldId: 1,
                    isVisible: isVisible[1],
                    onChanged: (text) {
                      players[1] = text;
                      setState(() {
                        if (!isVisible[2]) {
                          isVisible[2] = true;
                        }
                      });
                    },
                  ),
                  PlayerTextField(
                    fieldId: 2,
                    isVisible: isVisible[2],
                    onChanged: (text) {
                      players[2] = text;
                      setState(() {
                        if (!isVisible[3]) {
                          isVisible[3] = true;
                        }
                      });
                    },
                  ),
                  PlayerTextField(
                    fieldId: 3,
                    isVisible: isVisible[3],
                    onChanged: (text) {
                      players[3] = text;
                    },
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('Kreni'),
                  onPressed: () {
                    print(players);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
