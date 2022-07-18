import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../widgets/app_text_form_field.dart';
import '../widgets/feed_view.dart';
import '../widgets/loading_feed.dart';
import '../../shared/ui/scale.dart';
import '../../domain/entities/picture_entity.dart';
import '../controllers/home_view_controller.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
        key: widget.scaffoldKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Nasa Astronomy Picture Of The Day',
            style: TextStyle(fontSize: AppFontSize.s0),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextFormField(controller: homeViewController),
            ValueListenableBuilder<bool>(
              valueListenable: homeViewController.isSearchInView,
              builder: (context, searchController, _) {
                return ValueListenableBuilder<bool>(
                  valueListenable: homeViewController.isListLoaded,
                  builder: (context, isListLoaded, _) {
                    if (searchController == true) {
                      return ValueListenableBuilder<List<PictureEntity>>(
                        valueListenable: homeViewController.searchedPictures,
                        builder: (context, searchedPictures, _) {
                          {
                            if (isListLoaded == true) {
                              return FeedView(
                                  onRefresh: () => homeViewController.fetchData(), pictureList: searchedPictures);
                            } else {
                              return const LoadingFeed();
                            }
                          }
                        },
                      );
                    } else {
                      return ValueListenableBuilder<List<PictureEntity>>(
                        valueListenable: homeViewController.pictures,
                        builder: (context, pictureList, _) {
                          {
                            if (isListLoaded == true) {
                              return FeedView(
                                  onRefresh: () => homeViewController.fetchData(), pictureList: pictureList);
                            } else {
                              return const LoadingFeed();
                            }
                          }
                        },
                      );
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
