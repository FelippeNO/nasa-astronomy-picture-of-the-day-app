import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
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
        backgroundColor: Colors.black,
        appBar: AppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFormField(
              controller: homeViewController.searchController.value,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  homeViewController.isSearchInView.value = true;
                  homeViewController.search();
                } else {
                  homeViewController.isSearchInView.value = false;
                }
              },
            ),
            ValueListenableBuilder<bool>(
                valueListenable: homeViewController.isSearchInView,
                builder: (context, searchController, _) {
                  return ValueListenableBuilder<bool>(
                    valueListenable: homeViewController.isListLoaded,
                    builder: (context, value, _) {
                      if (searchController == true) {
                        return ValueListenableBuilder<List<PictureEntity>>(
                          valueListenable: homeViewController.searchedPictures,
                          builder: (context, searchedPictures, _) {
                            {
                              return SizedBox(
                                height: Scale.height(75),
                                child: ListView.builder(
                                  itemCount: searchedPictures.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Modular.to.pushNamed('/core/detailed');
                                      },
                                      child: PictureTile(
                                        pictureEntity: searchedPictures[index],
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        );
                      } else {
                        return ValueListenableBuilder<List<PictureEntity>>(
                          valueListenable: homeViewController.pictureOfTheDayList,
                          builder: (context, pictureList, _) {
                            {
                              return SizedBox(
                                height: Scale.height(75),
                                child: ListView.builder(
                                  itemCount: pictureList.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Modular.to.pushNamed('/core/detailed');
                                      },
                                      child: PictureTile(
                                        pictureEntity: pictureList[index],
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        );
                      }
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class PictureTile extends StatelessWidget {
  final PictureEntity pictureEntity;
  const PictureTile({Key? key, required this.pictureEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Scale.width(2)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(
            Scale.width(3),
          ),
        ),
        height: Scale.width(35),
        child: Padding(
          padding: EdgeInsets.all(
            Scale.width(3),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Scale.width(2),
                      ),
                      alignment: Alignment.center,
                      color: Colors.green,
                      height: Scale.width(14.5),
                      child: Text(
                        pictureEntity.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppFontSize.s3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      color: Colors.red,
                      height: Scale.width(14.5),
                      child: Text(
                        pictureEntity.formatDateMMMMDY(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: AppFontSize.s2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: Scale.width(29),
                      width: Scale.width(40),
                      decoration: BoxDecoration(borderRadius: AppBorderRadius.brAll5),
                      child: ClipRRect(
                        borderRadius: AppBorderRadius.brAll5,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: pictureEntity.url,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
