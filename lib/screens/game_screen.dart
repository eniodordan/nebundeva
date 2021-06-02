import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

class GameScreen extends StatefulWidget {
  static const String id = 'game_screen';

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'BUNDEVA',
                      style: TextStyle(
                        color: kGreenColour,
                        fontSize: 42,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Karata preostalo: ',
                          style: TextStyle(
                            color: kLightGreyColour,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          '15',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child: CardButton(
                    onPressed: () {},
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Na redu: ',
                          style: TextStyle(
                            color: kLightGreyColour,
                            fontSize: 36,
                          ),
                        ),
                        Text(
                          'Enio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 36,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Broj bundevi: ',
                          style: TextStyle(
                            color: kGreyColour,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            color: kLightGreyColour,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final VoidCallback onPressed;

  CardButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Container(
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset('images/queen_of_bells.jpg'),
            ),
          ),
        ),
      ),
      onTap: onPressed,
    );
  }
}
