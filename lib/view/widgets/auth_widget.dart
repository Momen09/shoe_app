import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget({
    super.key,
    required this.context,
    required this.backColor,
    required this.text,
    required this.textColor,
    required this.borderSideColor,
    required this.onPressed,
  });

  final BuildContext context;
  final Color backColor;
  final String text;
  final Color textColor;
  final Color borderSideColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          side: BorderSide(color: borderSideColor),
          elevation: 10,
          backgroundColor: backColor,
          minimumSize:
              Size.fromHeight(MediaQuery.of(context).size.height * 0.07),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          )),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
