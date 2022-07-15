import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/data/mappers/picture_entity_mapper.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/entities/picture_entity.dart';

void main() {
  final DateTime tDate = DateTime(2022, 01, 22);
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String tDateFormated = formatter.format(tDate);
  
  const String tExplanation =
      """On Monday, January's Full Moon rose as the Sun set. Spotted near the eastern horizon, its warm hues are seen in this photo taken near Cagliari, capital city of the Italian island of Sardinia. Of course the familiar patterns of light and dark across the Moon's nearside are created by bright rugged highlands and dark smooth lunar maria. Traditionally the patterns are seen as pareidolia, giving the visual illusion of a human face like the Man in the Moon, or familiar animal like the Moon rabbit. But for a moment the swarming murmuration, also known as a flock of starlings, frozen in the snapshot's field of view lends another pareidolic element to the scene. Some see the graceful figure of a dancer enchanted by moonlight.""";
  const String tTitle = "The Full Moon and the Dancer";
  const String tUrl = "https://apod.nasa.gov/apod/image/2201/IMG_4039copia2_1024.jpg";
  const String tHdurl = "https://apod.nasa.gov/apod/image/2201/IMG_4039copia2_2048.jpg";

  PictureEntity tPicture =
      PictureEntity(date: tDate, explanation: tExplanation, title: tTitle, url: tUrl, hdurl: tHdurl);

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

  test('pictureCreated should be generated with the same attributes as tPicture', () {
    final pictureCreated = PictureEntityMapper.fromJson(tPictureOfTheDayEntityJson);

    expect(tPicture.date, pictureCreated.date);
    expect(tPicture.title, pictureCreated.title);
    expect(tPicture.hdurl, pictureCreated.hdurl);
    expect(tPicture.url, pictureCreated.url);
    expect(tPicture.explanation, pictureCreated.explanation);
  });
}
