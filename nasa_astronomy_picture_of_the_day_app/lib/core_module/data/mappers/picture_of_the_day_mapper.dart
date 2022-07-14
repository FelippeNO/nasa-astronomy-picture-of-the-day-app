import 'package:intl/intl.dart';

import '../../domain/entities/picture_of_the_day_entity.dart';
import '../../error/exceptions.dart';

class PictureOfTheDayMapper {
  static PictureOfTheDayEntity fromJson(Map<String, dynamic> json) {
    try {
      return PictureOfTheDayEntity(
        date: DateTime.parse(json['date']),
        title: json['title'],
        explanation: json['explanation'],
        hdurl: json['hdurl'],
        url: json['url'],
      );
    } catch (e, stacktrace) {
      throw JSONParserException(stacktrace, 'PictureOfTheDayMapper.fromJson', e);
    }
  }

  static Map<String, dynamic> toJson(PictureOfTheDayEntity picture) {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');

    final Map<String, String> data = <String, String>{};
    try {
      data['date'] = formatter.format(picture.date);
      data['explanation'] = picture.explanation;
      data['hdurl'] = picture.hdurl;
      data['title'] = picture.title;
      data['url'] = picture.url;
      return data;
    } catch (e, stacktrace) {
      throw JSONParserException(stacktrace, 'PictureOfTheDayMapper.toJson', e);
    }
  }
}
