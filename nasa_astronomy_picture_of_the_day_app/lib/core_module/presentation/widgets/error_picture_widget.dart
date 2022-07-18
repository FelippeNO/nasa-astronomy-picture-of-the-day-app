import 'package:flutter/material.dart';

class ErrorPictureWidget extends StatelessWidget {
  const ErrorPictureWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: Text(
          "Couldn't get picture because it is not an image",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
