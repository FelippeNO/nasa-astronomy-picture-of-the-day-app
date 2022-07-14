import 'package:intl/intl.dart';

import '../../domain/entities/picture_entity.dart';
import '../../error/exceptions.dart';

class PictureEntityMapper {
  static PictureEntity fromJson(Map<String, dynamic> json) {
    try {
      return PictureEntity(
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

  static Map<String, dynamic> toJson(PictureEntity picture) {
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
