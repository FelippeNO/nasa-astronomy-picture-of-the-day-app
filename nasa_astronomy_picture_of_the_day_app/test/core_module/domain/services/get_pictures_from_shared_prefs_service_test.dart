import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/entities/picture_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/entities/proxies/proxy_picture_entity.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/i_repositories/i_core_repository.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/services/get_pictures_from_date_service.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/services/get_pictures_from_shared_prefs_service.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/error/failures.dart';

class MockCoreRepository extends Mock with ICoreRepository {}

void main() {
  late final ICoreRepository repository;
  late final GetPicturesFromSharedPrefsService service;

  final List<PictureEntity> tListPicturesOfTheDayEntity = ProxyPictureEntity.generateList();

  setUpAll(() {
    repository = MockCoreRepository();
    service = GetPicturesFromSharedPrefsService(repository);
  });

  test('Should return a List<PictureEntity> on successful return from the repository', () async {
    when(() => repository.getPicturesFromSharedPrefs()).thenAnswer((_) async => Right(tListPicturesOfTheDayEntity));
    final Either<CoreFailure, List<PictureEntity>> result = await service.call();
    expect(result, Right(tListPicturesOfTheDayEntity));
    verify(() => repository.getPicturesFromSharedPrefs()).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('Should return a GetPicturesFromSharedPrefsFailure on unsuccessful return from the repository', () async {
    when(() => repository.getPicturesFromSharedPrefs())
        .thenAnswer((_) async => Left(GetPicturesFromSharedPrefsFailure()));
    final Either<CoreFailure, List<PictureEntity>> result = await service.call();
    expect(result, Left(GetPicturesFromSharedPrefsFailure()));
    verify(() => repository.getPicturesFromSharedPrefs()).called(1);
    verifyNoMoreInteractions(repository);
  });
}
