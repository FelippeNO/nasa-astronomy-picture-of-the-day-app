import '../../domain/entities/picture_entity.dart';
import '../../error/success.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ICoreSharedPreferences {
  Future<CoreSuccess> savePicturesToSharedPrefs({required String data});
  Future<List<PictureEntity>> getPicturesFromSharedPrefs();
  Future<CoreSuccess> savePictureOfTheDayToSharedPrefs();
  Future<PictureEntity> getPictureOfTheDayFromSharedPrefs();
  Future<CoreSuccess> savePictureByDateToSharedPrefs({required String date, required String data});
  Future<PictureEntity> getPictureByDateFromSharedPrefs({required String date});
}

class CoreSharedPreferences implements ICoreSharedPreferences {
  @override
  Future<PictureEntity> getPictureByDateFromSharedPrefs({required String date}) {
    // TODO: implement getPictureByDateFromSharedPrefs
    throw UnimplementedError();
  }

  @override
  Future<PictureEntity> getPictureOfTheDayFromSharedPrefs() {
    // TODO: implement getPictureOfTheDayFromSharedPrefs
    throw UnimplementedError();
  }

  @override
  Future<List<PictureEntity>> getPicturesFromSharedPrefs() {
    // TODO: implement getPicturesFromSharedPrefs
    throw UnimplementedError();
  }

  @override
  Future<CoreSuccess> savePictureByDateToSharedPrefs({required String date, required String data}) {
    // TODO: implement savePictureByDateToSharedPrefs
    throw UnimplementedError();
  }

  @override
  Future<CoreSuccess> savePictureOfTheDayToSharedPrefs() {
    // TODO: implement savePictureOfTheDayToSharedPrefs
    throw UnimplementedError();
  }

  @override
  Future<CoreSuccess> savePicturesToSharedPrefs({required String data}) {
    // TODO: implement savePicturesToSharedPrefs
    throw UnimplementedError();
  }
}

  // @override
  // Future<CoreSuccess> savePictures({required String data}) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("pictures/", data);
  //   print(data);
  //   return SavePictureOfTheDayListSuccess();
  // }

  //   @override
  // Future<List<PictureEntity>> getPictures() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   if (prefs.getString("pictures/") == null) {}
  //   // TODO: implement getPictureOfTheDayList
  //   throw UnimplementedError();
  // }