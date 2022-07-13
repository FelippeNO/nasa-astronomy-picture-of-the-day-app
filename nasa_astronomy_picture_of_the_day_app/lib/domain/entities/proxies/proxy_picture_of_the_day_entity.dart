import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/picture_of_the_day_entity.dart';
import '../../../../core/proxies/proxier.dart';

class ProxyPictureOfTheDayEntity {
  static PictureOfTheDayEntity generateSingle() => PictureOfTheDayEntity(
      date: proxyDate, explanation: proxyWords(120), hdurl: proxyImgUrl, url: proxyImgUrl, title: proxyWords());

  static List<PictureOfTheDayEntity> generateList({int lenght = 12}) =>
      List.generate(lenght, (index) => generateSingle());
}
