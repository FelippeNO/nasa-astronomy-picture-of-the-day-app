import 'package:flutter/material.dart';
import '../../error/exceptions.dart';
import '../../domain/entities/picture_entity.dart';
import '../../domain/services/get_pictures_from_date_service.dart';

class HomeViewController extends ChangeNotifier {
  final GetPicturesFromDateService _getPicturesOfTheDayListFromDateService;

  HomeViewController(this._getPicturesOfTheDayListFromDateService);

  ValueNotifier<List<PictureEntity>> pictureOfTheDayList = ValueNotifier([]);
  ValueNotifier<bool> isListLoaded = ValueNotifier(false);

  void initialize() async {
    final serviceRequest = await _getPicturesOfTheDayListFromDateService.call(startDate: "2022-06-25");
    final result = serviceRequest.fold((l) => l, (r) => r);
    if (result is List<PictureEntity>) {
      pictureOfTheDayList.value = result;
    } else {
      throw CoreException(StackTrace.empty, "Couldn't get Pictures Of The Day List", Exception);
    }
    notifyListeners();
  }
}
