import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/entities/picture_entity.dart';

class PictureDetailedView extends StatelessWidget {
  final PictureEntity pictureEntity;
  const PictureDetailedView({Key? key, required this.pictureEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(onPressed: () => Modular.to.pop(), child: Text("to home")),
    );
  }
}
