import 'dart:convert';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/data/mappers/picture_entity_mapper.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/error/exceptions.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/shared/get_shared_preferences.dart';
import '../../domain/entities/picture_entity.dart';
import '../../error/success.dart';

abstract class ICoreSharedPreferences {
  Future<CoreSuccess> savePicturesToSharedPrefs({required String data});
  Future<List<PictureEntity>> getPicturesFromSharedPrefs();
  Future<CoreSuccess> savePictureOfTheDayToSharedPrefs();
  Future<PictureEntity> getPictureOfTheDayFromSharedPrefs();
  Future<CoreSuccess> savePictureByDateToSharedPrefs({required String date, required String data});
  Future<PictureEntity> getPictureByDateFromSharedPrefs({required String date});
}

class CoreSharedPreferences implements ICoreSharedPreferences {
  final IGetSharedPreferencesInstance _sharedPreferences;

  CoreSharedPreferences(this._sharedPreferences);

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
  Future<List<PictureEntity>> getPicturesFromSharedPrefs() async {
    final prefs = await _sharedPreferences.sharedPreferences;

    if (prefs.getString("pictures/") != null) {
      return List<PictureEntity>.from(
          json.decode(prefs.getString("pictures/")!).map((data) => PictureEntityMapper.fromJson(data)));
    } else {
      throw GetPicturesFromSharedPrefsException(
          StackTrace.empty, 'getPicturesFromSharedPrefs', Exception("pictures/ == null"));
    }
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
  Future<CoreSuccess> savePicturesToSharedPrefs({required String data}) async {
    final prefs = await _sharedPreferences.sharedPreferences;
    prefs.setString("pictures/", data);
    return CoreSuccess();
  }
}
