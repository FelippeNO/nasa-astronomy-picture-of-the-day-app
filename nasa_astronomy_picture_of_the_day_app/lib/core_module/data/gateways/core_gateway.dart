import 'dart:convert';
import 'package:http/http.dart';
import '../persistence/core_shared_preferences.dart';
import '../../shared/network/core_http_client.dart';
import '../mappers/picture_entity_mapper.dart';
import '../../domain/entities/picture_entity.dart';
import '../../error/exceptions.dart';

abstract class ICoreGateway {
  Future<List<PictureEntity>> getPicturesFromDate({required String startDate});
}

class CoreGateway implements ICoreGateway {
  final ICoreHttpClient _coreHttpClient;
  final ICoreSharedPreferences _coreSharedPrefs;

  CoreGateway(this._coreHttpClient, this._coreSharedPrefs);

  @override
  Future<List<PictureEntity>> getPicturesFromDate({required String startDate}) async {
    try {
      Response response = await _coreHttpClient.getPicturesFromDate(startDate);
      if (response.statusCode != 200) {
        throw GetPicturesException(
            StackTrace.empty, '_coreHttpClient.getPicturesListFromDate', Exception("statusCode != 200"));
      }
      await _coreSharedPrefs.savePicturesToSharedPrefs(data: response.body);
      return List<PictureEntity>.from(json.decode(response.body).map((data) => PictureEntityMapper.fromJson(data)));
    } catch (e, stacktrace) {
      throw GetPicturesException(stacktrace, '_coreHttpClient.getPicturesListFromDate', e);
    }
  }
}
