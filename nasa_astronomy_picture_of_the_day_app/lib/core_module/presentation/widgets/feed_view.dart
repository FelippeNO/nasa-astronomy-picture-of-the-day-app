import 'package:flutter/material.dart';
import '../../domain/entities/picture_entity.dart';
import 'picture_tile.dart';
import '../../shared/ui/scale.dart';
import '../../../global_module.dart';

class FeedView extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final List<PictureEntity> pictureList;

  const FeedView({super.key, required this.onRefresh, required this.pictureList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Scale.height(75),
      child: RefreshIndicator(
        onRefresh: () => onRefresh(),
        child: ListView.builder(
          itemCount: pictureList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                CoreNavigator.toDetailedView(pictureList[index]);
              },
              child: PictureTile(
                pictureEntity: pictureList[index],
              ),
            );
          },
        ),
      ),
    );
  }
}
