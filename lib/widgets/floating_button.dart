import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatefulWidget {
  const MyFloatingActionButton(
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
  State<MyFloatingActionButton> createState() => _MyFloatingActionButtonState();
}

class _MyFloatingActionButtonState extends State<MyFloatingActionButton> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: widget.elevation,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      backgroundColor: _colorScheme.tertiaryContainer,
      foregroundColor: _colorScheme.onTertiaryContainer,
      onPressed: widget.onPressed,
      child: widget.child,
    );
  }
}
