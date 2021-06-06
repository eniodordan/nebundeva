import 'package:flutter/material.dart';

class NotificationOverlay extends ModalRoute<void> {
  final Color overlayColour;
  final String notificationMessage;

  NotificationOverlay({
    required this.overlayColour,
    required this.notificationMessage,
  });

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => overlayColour.withOpacity(0.9);

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
            padding: EdgeInsets.symmetric(horizontal: 75),
            child: Text(
              notificationMessage,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 96),
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
