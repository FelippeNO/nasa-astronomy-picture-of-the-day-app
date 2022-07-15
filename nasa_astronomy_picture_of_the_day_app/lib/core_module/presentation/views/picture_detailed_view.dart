import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class PictureDetailedView extends StatelessWidget {
  const PictureDetailedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: () => Modular.to.pop(), child: Text("to home")),
    );
  }
}
