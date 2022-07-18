import 'dart:convert';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/data/mappers/picture_entity_mapper.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/error/exceptions.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/shared/get_shared_preferences.dart';
import '../../domain/entities/picture_entity.dart';
import '../../error/success.dart';

abstract class ICoreSharedPreferences {
  Future<CoreSuccess> savePicturesToSharedPrefs({required String data});
  Future<List<PictureEntity>> getPicturesFromSharedPrefs();
}

class CoreSharedPreferences implements ICoreSharedPreferences {
  final IGetSharedPreferencesInstance _sharedPreferences;

  CoreSharedPreferences(this._sharedPreferences);

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
  Future<CoreSuccess> savePicturesToSharedPrefs({required String data}) async {
    try {
      final prefs = await _sharedPreferences.sharedPreferences;
      prefs.setString("pictures/", data);
      return CoreSuccess();
    } catch (e) {
      throw SavePicturesToSharedPrefsException(
          StackTrace.empty, 'savePicturesToSharedPrefs', Exception("Could`nt save json to Shared Prefs"));
    }
  }
}
