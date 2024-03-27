
import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton(
      {
      // required this.animation,
      required this.child,
      required this.elevation,
      required this.onPressed,
      super.key});
  // final Animation<double> animation;
  final VoidCallback? onPressed;
  final Widget? child;
  final double? elevation;

  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  // late final Animation<double> _scaleAnimation =
  //     ScaleAnimation(parent: widget.animation);
  // late final Animation<double> _shapeAnimation =
  //     ShapeAnimation(parent: widget.animation);
  @override
  Widget build(BuildContext context) {
    return
        // ScaleTransition(
        // scale: _scaleAnimation,
        // child:
        FloatingActionButton(
      elevation: widget.elevation,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30
              // lerpDouble(30, 15, _shapeAnimation.value)!
              ),
        ),
      ),
      backgroundColor: _colorScheme.tertiaryContainer,
      foregroundColor: _colorScheme.onTertiaryContainer,
      onPressed: widget.onPressed,
      child: widget.child,
      // )
    );
  }
}
