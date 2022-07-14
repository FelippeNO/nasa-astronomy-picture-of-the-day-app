import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/picture_of_the_day_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/entities/proxies/proxy_picture_of_the_day_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/i_repositories/i_core_repository.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/domain/services/get_pictures_of_the_day_list_service.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/error/failures.dart';

class MockCoreRepository extends Mock with ICoreRepository {}

void main() {
  late final ICoreRepository repository;
  late final GetPicturesOfTheDayListFromDateService service;

  const String tStartDate = '2022-06-20';
  final List<PictureOfTheDayEntity> tListPicturesOfTheDayEntity = ProxyPictureOfTheDayEntity.generateList();

  setUpAll(() {
    repository = MockCoreRepository();
    service = GetPicturesOfTheDayListFromDateService(repository);
  });

  test('Should return a List<PictureOfTheDayEntity> on successful return from the repository', () async {
    when(() => repository.getPicturesListFromDate(startDate: any(named: 'startDate')))
        .thenAnswer((_) async => Right(tListPicturesOfTheDayEntity));
    final Either<CoreFailure, List<PictureOfTheDayEntity>> result = await service.call(startDate: tStartDate);
    expect(result, Right(tListPicturesOfTheDayEntity));
    verify(() => repository.getPicturesListFromDate(startDate: tStartDate)).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Should return a GetPicturesListFromDateFailure on unsuccessful return from the repository', () async {
    when(() => repository.getPicturesListFromDate(startDate: any(named: 'startDate')))
        .thenAnswer((_) async => Left(GetPicturesListFromDateFailure()));
    final Either<CoreFailure, List<PictureOfTheDayEntity>> result = await service.call(startDate: tStartDate);
    expect(result, Left(GetPicturesListFromDateFailure()));
    verify(() => repository.getPicturesListFromDate(startDate: tStartDate)).called(1);
    verifyNoMoreInteractions(repository);
  });
}
