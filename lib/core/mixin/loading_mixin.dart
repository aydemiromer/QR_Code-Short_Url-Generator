import 'package:flutter/cupertino.dart';

mixin LoadingState<T extends StatefulWidget> on State<T> {
  bool isLoading = false;
  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
