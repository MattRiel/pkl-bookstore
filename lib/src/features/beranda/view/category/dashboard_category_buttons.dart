import 'package:flutter/material.dart';

Widget categoryButton(String text, VoidCallback onPressed) {
  return Expanded(
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        backgroundColor: const Color(0xFFF0F0F0),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 13,
          color: Color(0xFF282828),
        ),
      ),
    ),
  );
}
