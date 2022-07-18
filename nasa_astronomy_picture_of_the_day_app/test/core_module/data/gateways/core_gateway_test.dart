import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/data/gateways/core_gateway.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/data/persistence/core_shared_preferences.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/entities/picture_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/error/exceptions.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/error/success.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/shared/get_shared_preferences.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/shared/network/core_http_client.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/shared/ui/connection_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MockCoreHttpClient extends Mock implements CoreHttpClient {}

class MockCoreSharedPrefs extends Mock implements CoreSharedPreferences {}

class MockGetSharedPreferencesInstance extends Mock implements GetSharedPreferencesInstance {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  DateTime tStartDateTime = DateTime(2022, 06, 29);
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String tFormattedDateTime = formatter.format(tStartDateTime);

  late MockCoreHttpClient coreHttpClient;
  late MockCoreSharedPrefs coreSharedPrefs;
  late CoreGateway coreGateway;

  setUp(() {
    coreHttpClient = MockCoreHttpClient();
    coreSharedPrefs = MockCoreSharedPrefs();
    coreGateway = CoreGateway(coreHttpClient, coreSharedPrefs);
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

  group('CoreGateway.getPicturesFromDate', () {
    test('Should return a PictureEntity List on success', () async {
      when(() => coreHttpClient.getPicturesFromDate(tFormattedDateTime))
          .thenAnswer((_) async => http.Response(json.encode(tPictureOfTheDayEntityJsonList), 200));
      final result = await coreGateway.getPicturesFromDate(startDate: tFormattedDateTime);

      SharedPreferences.setMockInitialValues({"tPicture/": tPictureOfTheDayEntityJsonList.toString()});
      SharedPreferences.getInstance().then((value) {
        expect(value.getString("tPicture/"), tPictureOfTheDayEntityJsonList.toString());
      });

      expect(result, isA<List<PictureEntity>>());
      verify(() => coreHttpClient.getPicturesFromDate(tFormattedDateTime)).called(1);
      verifyNoMoreInteractions(coreHttpClient);
    });
  });

  test('Should throws a GetPicturesException on failure', () async {
    when(() => coreHttpClient.getPicturesFromDate(tFormattedDateTime))
        .thenAnswer((_) async => http.Response("333", 410));

    await expectLater(
        coreGateway.getPicturesFromDate(startDate: tFormattedDateTime), throwsA(isA<GetPicturesException>()));

    verify(() => coreHttpClient.getPicturesFromDate(tFormattedDateTime)).called(1);
    verifyNoMoreInteractions(coreHttpClient);
  });
}
