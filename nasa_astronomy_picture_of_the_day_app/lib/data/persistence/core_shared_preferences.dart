import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/picture_of_the_day_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/error/success.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICoreSharedPreferences {
  Future<CoreSuccess> savePictureOfTheDayList({required String data});
  Future<CoreSuccess> savePictureOfTheDay({required String date, required String data});
  Future<List<PictureOfTheDayEntity>> getPictureOfTheDayList();
  Future<PictureOfTheDayEntity> getPictureOfTheDay({required String date});
}

class CoreSharedPreferences implements ICoreSharedPreferences {
  @override
  Future<PictureOfTheDayEntity> getPictureOfTheDay({required String date}) async {
    // TODO: implement getPictureOfTheDay
    throw UnimplementedError();
  }

  @override
  Future<List<PictureOfTheDayEntity>> getPictureOfTheDayList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("pictures/") == null) {}

    // TODO: implement getPictureOfTheDayList
    throw UnimplementedError();
  }

  @override
  Future<CoreSuccess> savePictureOfTheDay({required String date, required String data}) async {
    // TODO: implement savePictureOfTheDay
    throw UnimplementedError();
  }

  @override
  Future<CoreSuccess> savePictureOfTheDayList({required String data}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("pictures/", data);
    print(data);
    return SavePictureOfTheDayListSuccess();
  }
}
