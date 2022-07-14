import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core/core_http_client.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/picture_of_the_day_entity.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/proxies/proxy_picture_of_the_day_entity.dart';

abstract class ICoreGateway {
  Future<List<PictureOfTheDayEntity>> getImagesList({required String startDate});
}

class CoreGateway implements ICoreGateway {
  @override
  Future<List<PictureOfTheDayEntity>> getImagesList({required String startDate}) async {
    final imagesListUri = CoreHttpClient().httpClientUri(startDate);
    debugPrint(imagesListUri.toString());
    Response response = await CoreHttpClient().get(imagesListUri);
    debugPrint(response.body);
    // List<PictureOfTheDayEntity> list = ProxyPictureOfTheDayEntity.generateList();
    // return list;
  }
}
