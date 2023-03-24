import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;
  const ButtonWidget({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      height: 40,
      child: OutlinedButton(
        onPressed: null,
        style: OutlinedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
        child: Text(
          title,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
