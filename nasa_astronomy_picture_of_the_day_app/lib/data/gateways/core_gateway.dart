import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/picture_of_the_day_entity.dart';

abstract class ICoreGateway {
  Future<List<PictureOfTheDayEntity>> getImagesList({required String startDate, required String endDate});
}

class CoreGateway implements ICoreGateway {
  @override
  Future<List<PictureOfTheDayEntity>> getImagesList({required String startDate, required String endDate}) async {
    // TODO: implement getImagesList
    throw UnimplementedError();
  }
}
