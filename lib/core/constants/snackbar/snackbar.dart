import 'package:flutter/material.dart';

class SnackBarClass {
  static successSnackBar(color) => SnackBar(
        content: Text('Başarılı'),
        backgroundColor: color,
      );

       static cancelSnackBar(color) => SnackBar(
        content: Text('Başarısız'),
        backgroundColor: color,
      );
}
