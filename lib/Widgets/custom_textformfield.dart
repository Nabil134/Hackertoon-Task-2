import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final TextEditingController controller;

  IconData? prefix_icon;
  IconData? suffix_icon;
  final bool obscureText;
  CustomTextFormField({
    super.key,
    required this.title,
    this.prefix_icon,
    this.suffix_icon,
    required this.obscureText,
    required this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
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
