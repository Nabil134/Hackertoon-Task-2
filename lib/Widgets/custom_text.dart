import 'package:flutter/material.dart';

CustomText({required title, size, font, clr}) {
  return Text(
    title,
    style: TextStyle(
      color: clr,
      fontWeight: font,
      fontSize: size,
    ),
  );
}
