import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/data/persistence/core_shared_preferences.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/entities/picture_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/error/exceptions.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/error/failures.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/error/success.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/shared/get_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockCoreSharedPrefs extends Mock implements CoreSharedPreferences {}

class MockGetSharedPreferencesInstance extends Mock implements GetSharedPreferencesInstance {}

void main() {
  late CoreSharedPreferences sharedPrefs;
  late MockGetSharedPreferencesInstance getSharedPrefInstance;

  setUp(() {
    getSharedPrefInstance = MockGetSharedPreferencesInstance();
    sharedPrefs = CoreSharedPreferences(getSharedPrefInstance);
  });

  const String tMapKey = "pictures/";

  final List<Map<String, String>> tPictureOfTheDayEntityJsonList = [
    {
      "copyright": "Elena Pinna",
      "date": "2022-01-22",
      "explanation":
          "On Monday, January's Full Moon rose as the Sun set. Spotted near the eastern horizon, its warm hues are seen in this photo taken near Cagliari, capital city of the Italian island of Sardinia. Of course the familiar patterns of light and dark across the Moon's nearside are created by bright rugged highlands and dark smooth lunar maria. Traditionally the patterns are seen as pareidolia, giving the visual illusion of a human face like the Man in the Moon, or familiar animal like the Moon rabbit. But for a moment the swarming murmuration, also known as a flock of starlings, frozen in the snapshot's field of view lends another pareidolic element to the scene. Some see the graceful figure of a dancer enchanted by moonlight.",
      "hdurl": "https://apod.nasa.gov/apod/image/2201/IMG_4039copia2_2048.jpg",
      "media_type": "image",
      "service_version": "v1",
      "title": "The Full Moon and the Dancer",
      "url": "https://apod.nasa.gov/apod/image/2201/IMG_4039copia2_1024.jpg"
    }
  ];

  final String responseBody = jsonEncode(tPictureOfTheDayEntityJsonList);

  group('CoreSharedPreferences.getPicturesFromSharedPrefs', () {
    test('Should return a PictureEntity List on success', () async {
      SharedPreferences.setMockInitialValues({tMapKey: responseBody});
      final tSharedPrefs = await SharedPreferences.getInstance();
      when(() => getSharedPrefInstance.sharedPreferences).thenAnswer((_) async => tSharedPrefs);
      final result = await sharedPrefs.getPicturesFromSharedPrefs();
      verify(() => getSharedPrefInstance.sharedPreferences).called(1);
      verifyNoMoreInteractions(getSharedPrefInstance);
      expect(result, isA<List<PictureEntity>>());
    });

    test('Should throws a GetPicturesFromSharedPrefsException on failure', () async {
      SharedPreferences.setMockInitialValues({"": responseBody});
      final tSharedPrefs = await SharedPreferences.getInstance();
      when(() => getSharedPrefInstance.sharedPreferences).thenAnswer((_) async => tSharedPrefs);
      expectLater(sharedPrefs.getPicturesFromSharedPrefs(), throwsA(isA<GetPicturesFromSharedPrefsException>()));
      verify(() => getSharedPrefInstance.sharedPreferences).called(1);
      verifyNoMoreInteractions(getSharedPrefInstance);
    });
  });

  group('CoreSharedPreferences.savePicturesToSharedPrefs', () {
    test('Should return a CoreSuccess List on success', () async {
      SharedPreferences.setMockInitialValues({tMapKey: responseBody});
      final tSharedPrefs = await SharedPreferences.getInstance();
      when(() => getSharedPrefInstance.sharedPreferences).thenAnswer((_) async => tSharedPrefs);
      final result = await sharedPrefs.savePicturesToSharedPrefs(data: responseBody);
      verify(() => getSharedPrefInstance.sharedPreferences).called(1);
      verifyNoMoreInteractions(getSharedPrefInstance);
      expect(result, isA<CoreSuccess>());
    });

    test('Should throws a GetPicturesFromSharedPrefsException on failure', () async {
      SharedPreferences.setMockInitialValues({"": responseBody});
      when(() => getSharedPrefInstance.sharedPreferences).thenThrow((_) async => CoreFailure());
      expectLater(sharedPrefs.savePicturesToSharedPrefs(data: responseBody),
          throwsA(isA<SavePicturesToSharedPrefsException>()));
      verify(() => getSharedPrefInstance.sharedPreferences).called(1);
      verifyNoMoreInteractions(getSharedPrefInstance);
    });
  });
}
