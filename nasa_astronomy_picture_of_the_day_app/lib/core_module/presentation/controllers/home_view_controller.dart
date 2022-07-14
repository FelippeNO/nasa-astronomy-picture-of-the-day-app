import 'package:flutter/material.dart';
import '../../error/exceptions.dart';
import '../../domain/entities/picture_of_the_day_entity.dart';
import '../../domain/services/get_pictures_of_the_day_list_service.dart';

class HomeViewController extends ChangeNotifier {
  final GetPicturesOfTheDayListFromDateService _getPicturesOfTheDayListFromDateService;

  HomeViewController(this._getPicturesOfTheDayListFromDateService);

  ValueNotifier<List<PictureOfTheDayEntity>> pictureOfTheDayList = ValueNotifier([]);
  ValueNotifier<bool> isListLoaded = ValueNotifier(false);

  void initialize() async {
    final serviceRequest = await _getPicturesOfTheDayListFromDateService.call(startDate: "2022-06-25");
    final result = serviceRequest.fold((l) => l, (r) => r);
    if (result is List<PictureOfTheDayEntity>) {
      pictureOfTheDayList.value = result;
    } else {
      throw CoreException(StackTrace.empty, "impossivel fold", Exception);
    }
    notifyListeners();
  }
}
