import 'package:dartz/dartz.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/data/gateways/core_gateway.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/picture_of_the_day_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/i_repositories/i_core_repository.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/error/failures.dart';

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
