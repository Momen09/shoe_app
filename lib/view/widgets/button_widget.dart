import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final Color backgroundColor;
  final VoidCallback onPressed;
  final String name;
  final Color textColor;

  ButtonWidget({
    Key? key,
    required this.backgroundColor,
    required this.onPressed,
    required this.name,
    required this.textColor,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
          side: const BorderSide(color: Colors.white),
          elevation: 10,
          backgroundColor: widget.backgroundColor,
          minimumSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          )),
      child: Text(
        widget.name,
        style: TextStyle(
          color: widget.textColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
