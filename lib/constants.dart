import 'package:flutter/material.dart';

const kDarkBlueColor = Colors.white;
const kMyGreenColor = Color(0xff00B8A9);
const kMyRedColor = Color(0xffE5456B);
const kmyBlueColor = Color(0xff3777CC);
const kLightBlueColor = Color(0xff5D8BF4);
InputDecoration inputDecoTextField(String hintText) {
  return InputDecoration(
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.white70),
    fillColor: Colors.white,
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.white, width: 3),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.white, width: 3),
    ),
  );
}
