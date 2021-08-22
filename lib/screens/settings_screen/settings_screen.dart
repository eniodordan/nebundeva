import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = 'settings_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: kGreyColour,
                    ),
                    onTap: () => Navigator.pop(context),
                  ),
                  Text(
                    AppLocalizations.of(context)!.selectMode,
                    style: TextStyle(
                      fontSize: 24,
                      color: kGreyColour,
                    ),
                  ),
                  Container(width: 32),
                ],
              ),
              SizedBox(height: 50),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
