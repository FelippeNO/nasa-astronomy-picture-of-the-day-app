import 'package:flutter/material.dart';
import '../controllers/home_view_controller.dart';
import '../../shared/ui/scale.dart';

class AppTextFormField extends StatelessWidget {
  final HomeViewController controller;
  const AppTextFormField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: Scale.width(2)),
      height: Scale.width(15),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Scale.width(3)),
        child: TextFormField(
          style: TextStyle(color: Colors.white, fontSize: AppFontSize.s4),
          decoration: InputDecoration(
              icon: const Icon(Icons.search, color: Colors.white),
              fillColor: Colors.white.withOpacity(0.2),
              filled: true,
              labelText: "Search",
              hintText: "You can search a picture by title or by date.",
              hintStyle: TextStyle(color: Colors.white, fontSize: AppFontSize.s4)),
          controller: controller.searchController.value,
          onChanged: (value) {
            if (value.isNotEmpty) {
              controller.isSearchInView.value = true;
              controller.searchByNameAndDate();
            } else {
              controller.isSearchInView.value = false;
            }
          },
        ),
      ),
    );
  }
}
