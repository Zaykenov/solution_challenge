import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSelectButton extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;

  const CustomSelectButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CustomSelectButtonState createState() => _CustomSelectButtonState();
}

class _CustomSelectButtonState extends State<CustomSelectButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.title,
        style: TextStyle(fontSize: 14),
      ),
      trailing: CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected ? Colors.blue : Color(0xFFC7DDFF),
              width: 2.0,
            ),
            color: isSelected ? Colors.blue : Color(0xFFE3EEFF),
          ),
          child: isSelected
              ? Center(
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                )
              : null,
        ),
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
          widget.onPressed();
        },
      ),
    );
  }
}
