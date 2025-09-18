import 'package:flutter/material.dart';

class NoAnimationFloatingActionButtonAnimator extends FloatingActionButtonAnimator {
  @override
  Offset getOffset({Offset? begin, Offset? end, double? progress}) {
    return end ?? Offset.zero;
  }

  @override
  Animation<double> getScaleAnimation({Animation<double>? parent}) {
    return Tween<double>(begin: 1.0, end: 1.0).animate(parent!);
  }

  @override
  Animation<double> getRotationAnimation({Animation<double>? parent}) {
    return Tween<double>(begin: 0.0, end: 0.0).animate(parent!);
  }
}
