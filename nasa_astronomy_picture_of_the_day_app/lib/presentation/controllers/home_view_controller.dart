import 'package:flutter/material.dart';
import '../../domain/entities/picture_of_the_day_entity.dart';
import '../../domain/services/get_pictures_of_the_day_list_service.dart';

class HomeViewController extends ChangeNotifier {
  final GetPicturesOfTheDayListFromDateService _getPicturesOfTheDayListFromDateService;

  HomeViewController(this._getPicturesOfTheDayListFromDateService);

  static ValueNotifier<List<PictureOfTheDayEntity>> pictureOfTheDayList = ValueNotifier([]);

  void initialize() async {
    pictureOfTheDayList.value =
        _getPicturesOfTheDayListFromDateService.call(startDate: "startDate") as List<PictureOfTheDayEntity>;
  }
}
