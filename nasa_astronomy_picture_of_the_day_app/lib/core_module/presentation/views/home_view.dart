import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/shared/ui/scale.dart';
import '../../domain/entities/picture_entity.dart';
import '../controllers/home_view_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewController homeViewController = Modular.get();

  @override
  void initState() {
    homeViewController.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Scale.init(context);
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: ValueListenableBuilder<bool>(
          valueListenable: homeViewController.isListLoaded,
          builder: (context, value, _) {
            return ValueListenableBuilder<List<PictureEntity>>(
                valueListenable: homeViewController.pictureOfTheDayList,
                builder: (context, list, _) {
                  {
                    return ListView.builder(
                        itemCount: list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(color: Colors.red, height: 50, child: Text(list[index].title));
                        });
                  }
                });
          }),
    ));
  }
}
