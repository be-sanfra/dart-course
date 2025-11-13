import 'package:flutter/material.dart';

class ButtonModel extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  const ButtonModel({
    super.key,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 17,
              fontFamily: 'PressStart2P',
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
