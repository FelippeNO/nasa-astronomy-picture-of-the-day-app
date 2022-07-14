import 'package:dartz/dartz.dart';
import '../entities/picture_entity.dart';
import '../i_repositories/i_core_repository.dart';
import '../../error/failures.dart';

class GetPicturesFromDateService {
  final ICoreRepository _repository;

  GetPicturesFromDateService(this._repository);

  Future<Either<CoreFailure, List<PictureEntity>>> call({required String startDate}) async =>
      await _repository.getPicturesFromDate(startDate: startDate);
}
