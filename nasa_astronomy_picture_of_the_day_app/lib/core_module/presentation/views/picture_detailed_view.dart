import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/entities/picture_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/presentation/views/home_view.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/shared/ui/scale.dart';

class PictureDetailedView extends StatelessWidget {
  final PictureEntity picture;
  const PictureDetailedView({Key? key, required this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: Scale.width(6), vertical: Scale.width(5)),
          decoration: BoxDecoration(color: Colors.white.withOpacity(0.25), borderRadius: AppBorderRadius.brAll5),
          width: Scale.width(100),
          height: Scale.height(75),
          child: ListView(
            children: [
              Align(
                child: YellowBorderContainer(text: picture.title, height: Scale.width(10)),
              ),
              SizedBox(height: Scale.height(1)),
              Align(child: YellowBorderContainer(text: picture.formatDateMMMMDY(), height: Scale.width(8))),
              SizedBox(height: Scale.height(2)),
              SizedBox(
                height: Scale.height(30),
                child: CachedNetworkImage(
                  imageUrl: picture.url,
                  errorWidget: (context, url, error) => const ErrorPictureWidget(),
                ),
              ),
              SizedBox(height: Scale.height(2)),
              YellowBorderContainer(text: picture.explanation)
            ],
          ),
        ),
      ),
    );
  }
}
