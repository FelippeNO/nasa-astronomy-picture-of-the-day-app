import 'package:dartz/dartz.dart';
import '../persistence/core_shared_preferences.dart';
import '../../domain/entities/picture_entity.dart';
import '../../domain/i_repositories/i_core_repository.dart';
import '../../error/failures.dart';
import '../gateways/core_gateway.dart';

class CoreRepository implements ICoreRepository {
  final ICoreGateway _gateway;
  final ICoreSharedPreferences _sharedPrefs;

  CoreRepository(this._gateway, this._sharedPrefs);

  @override
  Future<Either<CoreFailure, List<PictureEntity>>> getPicturesFromDate({required String startDate}) async {
    try {
      final List<PictureEntity> gatewayResult = await _gateway.getPicturesFromDate(startDate: startDate);
      return Right(gatewayResult);
    } on Exception {
      return Left(GetPicturesFromDateFailure());
    }
  }

  @override
  Future<Either<CoreFailure, List<PictureEntity>>> getPicturesFromSharedPrefs() async {
    try {
      final List<PictureEntity> result = await _sharedPrefs.getPicturesFromSharedPrefs();
      return Right(result);
    } on Exception {
      return Left(GetPicturesFromSharedPrefsFailure());
    }
  }
}
