import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../core/core_http_client.dart';
import '../mappers/picture_of_the_day_mapper.dart';
import '../../domain/entities/picture_of_the_day_entity.dart';
import '../../error/exceptions.dart';

abstract class ICoreGateway {
  Future<List<PictureOfTheDayEntity>> getPicturesList({required String startDate});
}

class CoreGateway implements ICoreGateway {
  final ICoreHttpClient _coreHttpClient;

  CoreGateway(this._coreHttpClient);

  @override
  Future<List<PictureOfTheDayEntity>> getPicturesList({required String startDate}) async {
    try {
      Response response = await _coreHttpClient.get(startDate);
      if (response.statusCode != 200) {
        throw GetPicturesListException();
      }
      return List<PictureOfTheDayEntity>.from(
          json.decode(response.body).map((data) => PictureOfTheDayMapper.fromJson(data)));
    } catch (e) {
      throw GetPicturesListException();
    }
  }
}
