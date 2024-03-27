import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final String label;
  final VoidCallback callback;
  const MyButton({required this.label, required this.callback, super.key});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  final ValueNotifier<bool> _isHover = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.callback,
      onHover: (value) {
        _isHover.value = value;
      },
      child: Text(
        widget.label,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: MediaQuery.of(context).size.width / 110),
      ),
    );
  }
}
