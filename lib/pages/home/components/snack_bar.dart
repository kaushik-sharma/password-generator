import 'package:flutter/material.dart';

void buildSnackBar({
  required BuildContext context,
  required String message,
}) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
      duration: const Duration(seconds: 5),
      backgroundColor: Colors.red,
      padding: const EdgeInsets.all(20.0),
      width: 400.0,
    ),
  );
}
