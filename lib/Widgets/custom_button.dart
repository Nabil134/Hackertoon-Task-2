import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String name;

  final Function()? onPressed;
  CustomButton({required this.name, required this.onPressed});
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return /*last portion and Elevated Button start here*/
        Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xff0A1172),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff0A1172),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        child: Text(
          widget.name,
          style: TextStyle(
            color: Color(0xffFFFFFF),
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        onPressed: widget.onPressed,
      ),
    );
/*last portion and Elevated Button end here*/
  }
}
