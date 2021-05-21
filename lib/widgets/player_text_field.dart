import 'package:flutter/material.dart';

class PlayerTextField extends StatelessWidget {
  final int fieldId;
  final bool isVisible;
  final Function(String) onChanged;

  PlayerTextField({
    required this.fieldId,
    required this.isVisible,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Visibility(
        visible: isVisible,
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Ime #${fieldId + 1}',
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
