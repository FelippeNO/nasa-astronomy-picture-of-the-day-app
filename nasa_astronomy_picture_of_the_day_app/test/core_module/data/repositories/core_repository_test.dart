import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/data/gateways/core_gateway.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/data/persistence/core_shared_preferences.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/data/repositories/core_repository.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/entities/picture_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/entities/proxies/proxy_picture_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/i_repositories/i_core_repository.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/error/exceptions.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/error/failures.dart';

class MockCoreGateway extends Mock with ICoreGateway {}

class MockCoreSharedPrefs extends Mock with ICoreSharedPreferences {}

void main() {
  late final ICoreGateway gateway;
  late final ICoreRepository repository;
  late final ICoreSharedPreferences sharedPrefs;

  const String tStartDate = "2022-06-01";
  final List<PictureEntity> tPictureOfTheDayList = ProxyPictureEntity.generateList();

  setUpAll(() {
    sharedPrefs = MockCoreSharedPrefs();
    gateway = MockCoreGateway();
    repository = CoreRepository(gateway, sharedPrefs);
  });

  group('CoreRepository.getPicturesListFromDate', () {
    test('Should return a PictureEntity List on success', () async {
      when(() => gateway.getPicturesFromDate(startDate: any(named: 'startDate')))
          .thenAnswer((_) async => tPictureOfTheDayList);
      final result = await repository.getPicturesFromDate(startDate: tStartDate);
      expect(result, Right(tPictureOfTheDayList));
      verify(() => gateway.getPicturesFromDate(startDate: tStartDate)).called(1);
      verifyNoMoreInteractions(gateway);
    });

    test('Should return a GetPicturesFromDateFailure on failure', () async {
      when(() => gateway.getPicturesFromDate(startDate: any(named: 'startDate')))
          .thenThrow(GetPicturesException(StackTrace.empty, '', Exception()));
      final result = await repository.getPicturesFromDate(startDate: tStartDate);
      expect(result, Left(GetPicturesFromDateFailure()));
      verify(() => gateway.getPicturesFromDate(startDate: tStartDate)).called(1);
      verifyNoMoreInteractions(gateway);
    });
  });
}
