import 'package:dartz/dartz.dart';
import '../entities/picture_of_the_day_entity.dart';
import '../i_repositories/i_core_repository.dart';
import '../../error/failures.dart';

class GetPicturesOfTheDayListFromDateService {
  final ICoreRepository _repository;

  GetPicturesOfTheDayListFromDateService(this._repository);

  Future<Either<CoreFailure, List<PictureOfTheDayEntity>>> call({required String startDate}) async =>
      await _repository.getPicturesListFromDate(startDate: startDate);
}
