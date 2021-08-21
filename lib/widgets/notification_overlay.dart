import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NotificationOverlay extends ModalRoute<void> {
  final bool isPunishment;
  final String playerName;

  NotificationOverlay({required this.isPunishment, required this.playerName});

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => (isPunishment ? kRedColour : kGreenColour).withOpacity(0.9);

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.pop(context),
      child: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  playerName,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 84),
                ),
                Text(
                  isPunishment
                      ? AppLocalizations.of(context)!.drinks
                      : AppLocalizations.of(context)!.skips,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 84),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: child,
      ),
    );
  }
}
