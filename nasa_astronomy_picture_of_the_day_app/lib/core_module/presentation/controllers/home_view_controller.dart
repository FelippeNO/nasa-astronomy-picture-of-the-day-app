import 'package:flutter/material.dart';
import '../../error/exceptions.dart';
import '../../domain/entities/picture_entity.dart';
import '../../domain/services/get_pictures_from_date_service.dart';

class HomeViewController extends ChangeNotifier {
  final GetPicturesFromDateService _getPicturesOfTheDayListFromDateService;

  HomeViewController(this._getPicturesOfTheDayListFromDateService);

  ValueNotifier<List<PictureEntity>> pictureOfTheDayList = ValueNotifier([]);
  ValueNotifier<List<PictureEntity>> searchedPictures = ValueNotifier([]);
  ValueNotifier<bool> isSearchInView = ValueNotifier(false);
  ValueNotifier<bool> isListLoaded = ValueNotifier(false);
  ValueNotifier<TextEditingController> searchController = ValueNotifier(TextEditingController());

  void initialize() async {
    final serviceRequest = await _getPicturesOfTheDayListFromDateService.call(startDate: "2022-05-18");
    final result = serviceRequest.fold((l) => l, (r) => r);
    if (result is List<PictureEntity>) {
      pictureOfTheDayList.value = result;
    } else {
      throw CoreException(StackTrace.empty, "Couldn't get Pictures Of The Day List", Exception);
    }
    final listReversedOrder = pictureOfTheDayList.value.reversed;
    pictureOfTheDayList.value = listReversedOrder.toList();
    isListLoaded.value = true;
    notifyListeners();
  }

  void search() {
    final searchText = searchController.value.text;
    final list = pictureOfTheDayList.value;

    bool existsDateOrTitle(PictureEntity element) {
      if ((element.title.toLowerCase().contains(searchText.toLowerCase())) ||
          (element.formatDateYYYYMMDD().contains(searchText.toLowerCase())) ||
          (element.formatDateMMMMDY().toLowerCase().contains(searchText.toLowerCase()))) {
        return true;
      }
      return false;
    }

    final listFiltered = list.where((element) => existsDateOrTitle(element)).toList();
    searchedPictures.value = listFiltered;
    isSearchInView.value = true;
    notifyListeners();
  }
}
