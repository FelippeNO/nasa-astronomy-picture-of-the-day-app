import 'package:dartz/dartz.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/picture_of_the_day_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/i_repositories/i_core_repository.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/error/failures.dart';

class GetPicturesOfTheDayListFromDateService {
  final ICoreRepository _repository;

  GetPicturesOfTheDayListFromDateService(this._repository);

  Future<Either<CoreFailure, List<PictureOfTheDayEntity>>> call({required String startDate}) async =>
      await _repository.getPicturesListFromDate(startDate: startDate);
}
