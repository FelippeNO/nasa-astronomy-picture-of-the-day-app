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
}
