import 'package:flutter/material.dart';

Widget categoryButton(
    BuildContext context, String text, VoidCallback onPressed) {
  return Expanded(
    child: ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    ),
  );
}
