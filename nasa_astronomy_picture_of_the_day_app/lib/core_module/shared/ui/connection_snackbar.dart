import 'package:flutter/material.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/main.dart';

class ConnectionSnackBar extends SnackBar {
  final String message;
  final rootScaffoldMessengerKey = Core.rootScaffoldMessengerKey;

  ConnectionSnackBar(this.message, {Key? key}) : super(key: key, content: Text(message), backgroundColor: Colors.red);

  void show() {
    // ignore: unnecessary_null_comparison
    if (rootScaffoldMessengerKey != null) {
      rootScaffoldMessengerKey.currentState!.showSnackBar(ConnectionSnackBar(message));
    } else {}
  }
}
