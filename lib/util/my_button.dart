import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final color;
  final textColor;
  VoidCallback onPressed;
  MyButton({
    super.key,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,style: TextStyle(color: textColor),),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
            side: BorderSide(color: Color.fromARGB(255, 0, 0, 0), width: 1),
          ),
        ),
        backgroundColor: MaterialStateProperty.all<Color>(this.color),
      ),
    );
  }
}
