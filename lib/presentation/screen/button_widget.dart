import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {required this.icon, required this.onPressed, required this.color});

  final IconData icon;
  final onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 8,
      constraints: const BoxConstraints.tightFor(
        width: 60,
        height: 60,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      fillColor: color,
      child: Icon(icon),
    );
  }
}
