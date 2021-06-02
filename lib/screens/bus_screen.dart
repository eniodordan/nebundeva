import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

class BusScreen extends StatefulWidget {
  static const String id = 'bus_screen';

  @override
  _BusScreenState createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
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
                      'BUS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Razina: ',
                          style: TextStyle(
                            color: kGreyColour,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          ' od 5',
                          style: TextStyle(
                            color: kLightGreyColour,
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
                          'Enio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                        Text(
                          ' bira',
                          style: TextStyle(
                            color: kLightGreyColour,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LowHighButton(isLower: true),
                          SizedBox(width: 25),
                          LowHighButton(isLower: false),
                        ],
                      ),
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

class LowHighButton extends StatelessWidget {
  final bool isLower;

  LowHighButton({required this.isLower});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 120,
      child: ElevatedButton(
        child: Icon(isLower ? Icons.arrow_downward : Icons.arrow_upward),
        style: ElevatedButton.styleFrom(
          primary: isLower ? kRedColour : kGreenColour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
