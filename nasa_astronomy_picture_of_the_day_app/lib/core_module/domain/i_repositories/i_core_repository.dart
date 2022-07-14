import 'package:dartz/dartz.dart';
import '../entities/picture_of_the_day_entity.dart';
import '../../error/failures.dart';

abstract class ICoreRepository {
  Future<Either<CoreFailure, List<PictureEntity>>> getPicturesListFromDate({required String startDate});
}
