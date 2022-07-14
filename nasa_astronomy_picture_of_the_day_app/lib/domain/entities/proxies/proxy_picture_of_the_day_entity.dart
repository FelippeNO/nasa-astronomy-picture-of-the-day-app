import '../../../../core/proxies/proxier.dart';
import '../picture_of_the_day_entity.dart';

class ProxyPictureOfTheDayEntity {
  static PictureOfTheDayEntity generateSingle() => PictureOfTheDayEntity(
      date: proxyDate, explanation: proxyWords(120), hdurl: proxyImgUrl, url: proxyImgUrl, title: proxyWords());

  static List<PictureOfTheDayEntity> generateList({int lenght = 12}) =>
      List.generate(lenght, (index) => generateSingle());
}
