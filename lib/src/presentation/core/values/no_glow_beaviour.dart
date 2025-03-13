import 'package:flutter/material.dart';

/* class NoGlowScrollBehaviour extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
} */

class NoGlowScrollBehaviour extends ScrollBehavior {
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child; // No overscroll glow
  }
}
