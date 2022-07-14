import '../../domain/entities/picture_of_the_day_entity.dart';
import '../../error/success.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICoreSharedPreferences {
  Future<CoreSuccess> savePictureOfTheDayList({required String data});
  Future<CoreSuccess> savePictureOfTheDay({required String date, required String data});
  Future<List<PictureEntity>> getPictureOfTheDayList();
  Future<PictureEntity> getPictureOfTheDay({required String date});
}

class CoreSharedPreferences implements ICoreSharedPreferences {
  @override
  Future<PictureEntity> getPictureOfTheDay({required String date}) async {
    // TODO: implement getPictureOfTheDay
    throw UnimplementedError();
  }

  @override
  Future<List<PictureEntity>> getPictureOfTheDayList() async {
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
