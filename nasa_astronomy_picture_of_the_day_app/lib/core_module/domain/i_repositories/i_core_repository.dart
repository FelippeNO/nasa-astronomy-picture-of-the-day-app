import 'package:dartz/dartz.dart';
import '../entities/picture_entity.dart';
import '../../error/failures.dart';

abstract class ICoreRepository {
  Future<Either<CoreFailure, List<PictureEntity>>> getPicturesFromDate({required String startDate});
  Future<Either<CoreFailure, List<PictureEntity>>> getPicturesFromSharedPrefs();
}
