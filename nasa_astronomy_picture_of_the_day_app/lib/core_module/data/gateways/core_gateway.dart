import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/data/persistence/core_shared_preferences.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/presentation/views/home_view.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/shared/ui/connection_snackbar.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/main.dart';
import '../../shared/network/core_http_client.dart';
import '../mappers/picture_entity_mapper.dart';
import '../../domain/entities/picture_entity.dart';
import '../../error/exceptions.dart';

abstract class ICoreGateway {
  Future<List<PictureEntity>> getPicturesFromDate({required String startDate});
}

class CoreGateway implements ICoreGateway {
  // final rootScaffoldMessengerKey = Core.rootScaffoldMessengerKey;

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
