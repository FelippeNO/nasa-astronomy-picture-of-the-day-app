import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/picture_entity.dart';
import 'yellow_border_container.dart';
import '../../shared/ui/scale.dart';

import 'error_picture_widget.dart';

class PictureTile extends StatelessWidget {
  final PictureEntity pictureEntity;
  const PictureTile({Key? key, required this.pictureEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Scale.width(2)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow, width: Scale.width(1)),
          color: Colors.white.withOpacity(0.3),
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
                    YellowBorderContainer(text: pictureEntity.title, height: Scale.width(15)),
                    SizedBox(
                      height: Scale.width(2),
                    ),
                    YellowBorderContainer(text: pictureEntity.formatDateMMMMDY(), height: Scale.width(8)),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      height: Scale.width(27),
                      width: Scale.width(40),
                      decoration: BoxDecoration(borderRadius: AppBorderRadius.brAll5),
                      child: ClipRRect(
                        borderRadius: AppBorderRadius.brAll5,
                        child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: pictureEntity.url,
                            errorWidget: (context, url, error) => const ErrorPictureWidget()),
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
