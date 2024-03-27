import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Widget child;
  final String label;
  const MyCard({required this.child, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 5),
      child: SizedBox(
        width: 50,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
