import '../../domain/entities/picture_entity.dart';
import '../../error/exceptions.dart';

class PictureEntityMapper {
  static PictureEntity fromJson(Map<String, dynamic> json) {
    try {
      return PictureEntity(
        date: DateTime.parse(json['date']),
        title: json['title'],
        explanation: json['explanation'],
        url: json['url'],
      );
    } catch (e, stacktrace) {
      throw JSONParserException(stacktrace, 'PictureOfTheDayMapper.fromJson', e);
    }
  }

  static Map<String, dynamic> toJson(PictureEntity picture) {
    final Map<String, String> data = <String, String>{};
    try {
      data['date'] = picture.formatDateYYYYMMDD();
      data['explanation'] = picture.explanation;
      data['title'] = picture.title;
      data['url'] = picture.url;
      return data;
    } catch (e, stacktrace) {
      throw JSONParserException(stacktrace, 'PictureOfTheDayMapper.toJson', e);
    }
  }
}
