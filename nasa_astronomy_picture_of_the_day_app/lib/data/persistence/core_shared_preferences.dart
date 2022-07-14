import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/picture_of_the_day_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/error/success.dart';

abstract class ICoreSharedPreferences {
  CoreSuccess savePictureOfTheDayList();
  CoreSuccess savePictureOfTheDay();
  List<PictureOfTheDayEntity> getPictureOfTheDayList();
  PictureOfTheDayEntity getPictureOfTheDay(String date);
}
