import 'package:flutter/material.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/services/get_pictures_from_shared_prefs_service.dart';
import '../../error/exceptions.dart';
import '../../domain/entities/picture_entity.dart';
import '../../domain/services/get_pictures_from_date_service.dart';

class HomeViewController extends ChangeNotifier {
  final GetPicturesFromDateService _getPicturesFromDateService;
  final GetPicturesFromSharedPrefsService _getPicturesFromSharedPrefsService;

  HomeViewController(this._getPicturesFromDateService, this._getPicturesFromSharedPrefsService);

  ValueNotifier<List<PictureEntity>> pictures = ValueNotifier([]);
  ValueNotifier<List<PictureEntity>> searchedPictures = ValueNotifier([]);
  ValueNotifier<bool> isSearchInView = ValueNotifier(false);
  ValueNotifier<bool> isListLoaded = ValueNotifier(false);
  ValueNotifier<TextEditingController> searchController = ValueNotifier(TextEditingController());

  void initialize() async {
    await getPicturesFirstTime();
  }

  Future getPicturesFirstTime() async {
    final serviceRequest = await _getPicturesFromSharedPrefsService.call();
    final result = serviceRequest.fold((l) => l, (r) => r);
    if (result is List<PictureEntity>) {
      pictures.value = result;
      orderList();
    } else {
      fetchData();
    }
  }

  Future getPicturesFromSharedPreferences() async {
    final serviceRequest = await _getPicturesFromSharedPrefsService.call();
    final result = serviceRequest.fold((l) => l, (r) => r);

    if (result is List<PictureEntity>) {
      pictures.value = result;
    } else {
      throw CoreException(StackTrace.empty, "Couldn't get Pictures Of The Day List", CoreException);
    }
    orderList();
    isListLoaded.value = true;
    notifyListeners();
  }

  Future fetchData() async {
    final serviceRequest = await _getPicturesFromDateService.call(startDate: "2022-05-18");
    final result = serviceRequest.fold((l) => l, (r) => r);
    if (result is List<PictureEntity>) {
      pictures.value = result;
    } else {
      throw CoreException(StackTrace.empty, "Couldn't fetch Pictures", Exception);
    }
    orderList();
    notifyListeners();
  }

  void searchByNameAndDate() {
    final searchText = searchController.value.text;
    final list = pictures.value;

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

  void clearSearch() {
    searchController.value.clear();
    isSearchInView.value = false;
    notifyListeners();
  }

  void orderList() {
    final listReversedOrder = pictures.value.reversed;
    pictures.value = listReversedOrder.toList();
  }
}
