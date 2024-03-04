import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key, required this.textField, required this.jj, required this.labelText});

  final String textField;
  final bool jj;
  final String labelText;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.jj,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: widget.textField,
          labelText:widget.labelText,
      ),
    );
  }
}
