import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core/core_http_client.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/data/gateways/core_gateway.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/picture_of_the_day_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/error/exceptions.dart';

class MockCoreHttpClient extends Mock implements CoreHttpClient {}

void main() {
  DateTime tStartDateTime = DateTime(2022, 06, 29);
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String tFormattedDateTime = formatter.format(tStartDateTime);

  late MockCoreHttpClient coreHttpClient;
  late CoreGateway coreGateway;

  setUp(() {
    coreHttpClient = MockCoreHttpClient();
    coreGateway = CoreGateway(coreHttpClient);
  });

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

  final Map<String, String> tPictureOfTheDayEntityJson = {
    "copyright": "Elena Pinna",
    "date": "2022-01-22",
    "explanation":
        "On Monday, January's Full Moon rose as the Sun set. Spotted near the eastern horizon, its warm hues are seen in this photo taken near Cagliari, capital city of the Italian island of Sardinia. Of course the familiar patterns of light and dark across the Moon's nearside are created by bright rugged highlands and dark smooth lunar maria. Traditionally the patterns are seen as pareidolia, giving the visual illusion of a human face like the Man in the Moon, or familiar animal like the Moon rabbit. But for a moment the swarming murmuration, also known as a flock of starlings, frozen in the snapshot's field of view lends another pareidolic element to the scene. Some see the graceful figure of a dancer enchanted by moonlight.",
    "hdurl": "https://apod.nasa.gov/apod/image/2201/IMG_4039copia2_2048.jpg",
    "media_type": "image",
    "service_version": "v1",
    "title": "The Full Moon and the Dancer",
    "url": "https://apod.nasa.gov/apod/image/2201/IMG_4039copia2_1024.jpg"
  };

  group('CoreGateway.getPicturesListFromDate', () {
    test('Should return a PictureOfTheDayEntity List on success', () async {
      when(() => coreHttpClient.getPicturesListFromDate(tFormattedDateTime))
          .thenAnswer((_) async => http.Response(json.encode(tPictureOfTheDayEntityJsonList), 200));
      final result = await coreGateway.getPicturesListFromDate(startDate: tFormattedDateTime);
      expect(result, isA<List<PictureOfTheDayEntity>>());
      verify(() => coreHttpClient.getPicturesListFromDate(tFormattedDateTime)).called(1);
      verifyNoMoreInteractions(coreHttpClient);
    });

    test('Should throws a GetPicturesListException on failure', () async {
      when(() => coreHttpClient.getPicturesListFromDate(tFormattedDateTime))
          .thenAnswer((_) async => http.Response("", 418));

      await expectLater(
          coreGateway.getPicturesListFromDate(startDate: tFormattedDateTime), throwsA(isA<GetPicturesListException>()));

      verify(() => coreHttpClient.getPicturesListFromDate(tFormattedDateTime)).called(1);
      verifyNoMoreInteractions(coreHttpClient);
    });
  });

  group('CoreGateway.getPictureByDate', () {
    test('Should return a PictureOfTheDay on success', () async {
      when(() => coreHttpClient.getPictureByDate(tFormattedDateTime))
          .thenAnswer((_) async => http.Response(json.encode(tPictureOfTheDayEntityJson), 200));
      final result = await coreGateway.getPictureByDate(date: tFormattedDateTime);
      expect(result, isA<PictureOfTheDayEntity>());
      verify(() => coreHttpClient.getPictureByDate(tFormattedDateTime)).called(1);
      verifyNoMoreInteractions(coreHttpClient);
    });

    test('Should throws a GetPictureOfTheDayException on failure', () async {
      when(() => coreHttpClient.getPictureByDate(tFormattedDateTime)).thenAnswer((_) async => http.Response("", 418));

      await expectLater(
          coreGateway.getPictureByDate(date: tFormattedDateTime), throwsA(isA<GetPictureOfTheDayException>()));

      verify(() => coreHttpClient.getPictureByDate(tFormattedDateTime)).called(1);
      verifyNoMoreInteractions(coreHttpClient);
    });
  });
}
