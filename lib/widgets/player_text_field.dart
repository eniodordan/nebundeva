import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

class PlayerTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
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
          ),
        ),
      ),
    );
  }
}
