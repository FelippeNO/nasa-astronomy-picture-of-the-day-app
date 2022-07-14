import 'package:dartz/dartz.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/picture_of_the_day_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/error/failures.dart';

abstract class ICoreRepository {
  Future<Either<CoreFailure, List<PictureOfTheDayEntity>>> getPicturesListFromDate({required String startDate});
}
