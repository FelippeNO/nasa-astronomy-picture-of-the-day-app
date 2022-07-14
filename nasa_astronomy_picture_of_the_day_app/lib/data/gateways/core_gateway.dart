import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../../core/core_http_client.dart';
import '../mappers/picture_of_the_day_mapper.dart';
import '../../domain/entities/picture_of_the_day_entity.dart';
import '../../error/exceptions.dart';

abstract class ICoreGateway {
  Future<List<PictureOfTheDayEntity>> getPicturesListFromDate({required String startDate});
  Future<PictureOfTheDayEntity> getPictureByDate({required String date});
}

class CoreGateway implements ICoreGateway {
  final ICoreHttpClient _coreHttpClient;

  CoreGateway(this._coreHttpClient);

  @override
  Future<List<PictureOfTheDayEntity>> getPicturesListFromDate({required String startDate}) async {
    try {
      Response response = await _coreHttpClient.getPicturesListFromDate(startDate);
      if (response.statusCode != 200) {
        throw GetPicturesListException();
      }
      return List<PictureOfTheDayEntity>.from(
          json.decode(response.body).map((data) => PictureOfTheDayMapper.fromJson(data)));
    } catch (e) {
      throw GetPicturesListException();
    }
  }

  @override
  Future<PictureOfTheDayEntity> getPictureByDate({required String date}) async {
    try {
      Response response = await _coreHttpClient.getPictureByDate(date);
      if (response.statusCode != 200) {
        throw GetPictureOfTheDayException();
      }
      return PictureOfTheDayMapper.fromJson(json.decode(response.body));
    } catch (e) {
      throw GetPictureOfTheDayException();
    }
  }
}
