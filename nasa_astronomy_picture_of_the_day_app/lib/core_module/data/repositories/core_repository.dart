import 'package:dartz/dartz.dart';

import '../../domain/entities/picture_entity.dart';
import '../../domain/i_repositories/i_core_repository.dart';
import '../../error/failures.dart';
import '../gateways/core_gateway.dart';

class CoreRepository implements ICoreRepository {
  final ICoreGateway _gateway;

  CoreRepository(this._gateway);

  @override
  Future<Either<CoreFailure, List<PictureEntity>>> getPicturesFromDate({required String startDate}) async {
    try {
      final List<PictureEntity> gatewayResult = await _gateway.getPicturesFromDate(startDate: startDate);
      return Right(gatewayResult);
    } on Exception {
      return Left(GetPicturesFromDateFailure());
    }
  }
}
