import 'package:flutter/material.dart';
import 'package:nebundeva/widgets/player_text_field.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TextEditingController> _controllers = [];
  int _count = 1;

  @override
  void dispose() {
    for (int i = 0; i < _controllers.length; i++) {
      _controllers[i].dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = new List.generate(_count, (int i) {
      _controllers.add(TextEditingController());
      return PlayerTextField(controller: _controllers.last);
    });

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _children,
            ),
            TextButton(
              onPressed: () {
                for (int i = 0; i < _controllers.length; i++) {
                  print(_controllers[i].text);
                }
              },
              child: Text('Debug'),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _addPlayerTextField,
        ),
      ),
    );
  }

  void _addPlayerTextField() {
    setState(() {
      _count++;
    });
  }
}
