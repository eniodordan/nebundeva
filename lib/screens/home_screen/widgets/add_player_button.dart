import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddPlayerButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddPlayerButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 75),
      child: Container(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          child: Text(
            '${AppLocalizations.of(context)!.addPlayer} +',
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
    );
  }
}
