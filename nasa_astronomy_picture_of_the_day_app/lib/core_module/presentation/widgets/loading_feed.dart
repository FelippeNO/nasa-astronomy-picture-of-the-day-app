import 'package:flutter/material.dart';
import '../../shared/ui/scale.dart';

class LoadingFeed extends StatelessWidget {
  const LoadingFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Scale.height(75),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Getting data. Please wait."),
          Padding(
            padding: EdgeInsets.only(top: Scale.width(5)),
            child: const CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
