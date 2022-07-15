import 'package:dartz/dartz.dart';
import '../entities/picture_entity.dart';
import '../i_repositories/i_core_repository.dart';
import '../../error/failures.dart';

class GetPicturesFromSharedPrefsService {
  final ICoreRepository _repository;

  GetPicturesFromSharedPrefsService(this._repository);

  Future<Either<CoreFailure, List<PictureEntity>>> call() async => await _repository.getPicturesFromSharedPrefs();
}
