import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/data/gateways/core_gateway.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/data/repositories/core_repository.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/picture_of_the_day_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/proxies/proxy_picture_of_the_day_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/i_repositories/i_core_repository.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/error/exceptions.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/error/failures.dart';

class MockCoreGateway extends Mock with ICoreGateway {}

void main() {
  late final ICoreGateway gateway;
  late final ICoreRepository repository;

  const String tStartDate = "2022-06-01";
  final List<PictureOfTheDayEntity> tPictureOfTheDayList = ProxyPictureOfTheDayEntity.generateList();

  setUpAll(() {
    gateway = MockCoreGateway();
    repository = CoreRepository(gateway);
  });

  group('CoreRepository.getPicturesListFromDate', () {
    test('Should return a PictureOfTheDayEntity List on success', () async {
      when(() => gateway.getPicturesListFromDate(startDate: any(named: 'startDate')))
          .thenAnswer((_) async => tPictureOfTheDayList);
      final result = await repository.getPicturesListFromDate(startDate: tStartDate);
      expect(result, Right(tPictureOfTheDayList));
      verify(() => gateway.getPicturesListFromDate(startDate: tStartDate)).called(1);
      verifyNoMoreInteractions(gateway);
    });

    test('Should return a GetPicturesListFromDateFailure on failure', () async {
      when(() => gateway.getPicturesListFromDate(startDate: any(named: 'startDate')))
          .thenThrow(GetPicturesListException(StackTrace.empty, '', Exception()));
      final result = await repository.getPicturesListFromDate(startDate: tStartDate);
      expect(result, Left(GetPicturesListFromDateFailure()));
      verify(() => gateway.getPicturesListFromDate(startDate: tStartDate)).called(1);
      verifyNoMoreInteractions(gateway);
    });
  });
}
