import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../controllers/home_view_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final HomeViewController homeViewController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
