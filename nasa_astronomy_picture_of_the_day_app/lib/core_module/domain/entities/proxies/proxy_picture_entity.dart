import '../../../shared/proxies/proxier.dart';
import '../picture_entity.dart';

class ProxyPictureEntity {
  static PictureEntity generateSingle() => PictureEntity(
      date: proxyDate, explanation: proxyWords(120), hdurl: proxyImgUrl, url: proxyImgUrl, title: proxyWords());

  static List<PictureEntity> generateList({int lenght = 12}) => List.generate(lenght, (index) => generateSingle());
}
