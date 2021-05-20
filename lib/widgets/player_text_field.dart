import 'package:flutter/material.dart';

class PlayerTextField extends StatelessWidget {
  final TextEditingController controller;

  PlayerTextField({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(controller: controller);
  }
}
