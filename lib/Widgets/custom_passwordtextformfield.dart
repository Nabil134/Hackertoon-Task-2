import 'package:flutter/material.dart';

class CustomPasswordTextFormField extends StatefulWidget {
  final String title;

  IconData? prefix_icon;
  IconData? suffix_icon;
  final bool obscureText;
  final TextEditingController controller;
  CustomPasswordTextFormField({
    super.key,
    required this.title,
    this.prefix_icon,
    this.suffix_icon,
    required this.obscureText,
    required this.controller,
  });

  @override
  State<CustomPasswordTextFormField> createState() =>
      _CustomPasswordTextFormFieldState();
}

class _CustomPasswordTextFormFieldState
    extends State<CustomPasswordTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.title,
        hintStyle: TextStyle(
          color: Color(0xff171717),
          fontSize: 20,
        ),
        prefixIcon: Icon(
          widget.prefix_icon,
          color: Color(0xff171717),
        ),
        suffixIcon: Icon(
          widget.suffix_icon,
          color: Color(0xff171717),
        ),
      ),
    );
  }
}
