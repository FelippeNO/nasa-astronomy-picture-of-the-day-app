import 'dart:convert';
import 'package:http/http.dart';
import '../../shared/network/core_http_client.dart';
import '../mappers/picture_entity_mapper.dart';
import '../../domain/entities/picture_entity.dart';
import '../../error/exceptions.dart';

abstract class ICoreGateway {
  Future<List<PictureEntity>> getPicturesFromDate({required String startDate});
  Future<PictureEntity> getPictureByDate({required String date});
}

class CoreGateway implements ICoreGateway {
  final ICoreHttpClient _coreHttpClient;

  CoreGateway(this._coreHttpClient);

  @override
  Future<List<PictureEntity>> getPicturesFromDate({required String startDate}) async {
    try {
      Response response = await _coreHttpClient.getPicturesFromDate(startDate);
      if (response.statusCode != 200) {
        throw GetPicturesException(
            StackTrace.empty, '_coreHttpClient.getPicturesListFromDate', Exception("statusCode != 200"));
      }
      return List<PictureEntity>.from(json.decode(response.body).map((data) => PictureEntityMapper.fromJson(data)));
    } catch (e, stacktrace) {
      throw GetPicturesException(stacktrace, '_coreHttpClient.getPicturesListFromDate', e);
    }
  }

  @override
  Future<PictureEntity> getPictureByDate({required String date}) async {
    try {
      Response response = await _coreHttpClient.getPictureByDate(date);
      if (response.statusCode != 200) {
        throw GetPictureException(StackTrace.empty, '_coreHttpClient.getPictureByDate', Exception("statusCode != 200"));
      }
      return PictureEntityMapper.fromJson(json.decode(response.body));
    } catch (e, stacktrace) {
      throw GetPictureException(stacktrace, '_coreHttpClient.getPictureOfTheDayByDate', e);
    }
  }
}
