import 'package:flutter/material.dart';

class SnackBarClass {
  static successSnackBar(color, text) => SnackBar(
        content: Text(text),
        backgroundColor: color,
      );
  static cancelSnackBar(color, text) => SnackBar(
        content: Text(text),
        backgroundColor: color,
      );
}
