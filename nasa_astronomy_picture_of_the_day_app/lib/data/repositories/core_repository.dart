import 'package:dartz/dartz.dart';
import '../gateways/core_gateway.dart';
import '../../domain/entities/picture_of_the_day_entity.dart';
import '../../domain/i_repositories/i_core_repository.dart';
import '../../error/failures.dart';

class CoreRepository implements ICoreRepository {
  final ICoreGateway _gateway;

  CoreRepository(this._gateway);

  @override
  Future<Either<CoreFailure, List<PictureOfTheDayEntity>>> getPicturesListFromDate({required String startDate}) async {
    try {
      final List<PictureOfTheDayEntity> gatewayResult = await _gateway.getPicturesListFromDate(startDate: startDate);
      return Right(gatewayResult);
    } on Exception {
      return Left(GetPicturesListFromDateFailure());
    }
  }
}
