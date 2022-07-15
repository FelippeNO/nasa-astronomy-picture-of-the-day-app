import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_astronomy_picture_of_the_day_app/core_module/domain/entities/picture_entity.dart';

void main() {
  String tSearchText = "10";
  List<PictureEntity> tOriginalPictureList = [];
  List<PictureEntity> tSearchedPictureList = [];

  PictureEntity testPictureEntity1 = PictureEntity(
    date: DateTime(2022, 10, 31),
    explanation: "This is a test",
    title: "Test",
    url: "This is a test",
  );

  PictureEntity testPictureEntity2 = PictureEntity(
    date: DateTime(2021, 05, 25),
    explanation: "This is a test",
    title: "xxxxxxxxx",
    url: "This is a test",
  );

  PictureEntity testPictureEntity3 = PictureEntity(
    date: DateTime(2021, 05, 25),
    explanation: "This is a test",
    title: "foo 10",
    url: "This is a test",
  );

  tOriginalPictureList.add(testPictureEntity1);
  tOriginalPictureList.add(testPictureEntity2);
  tOriginalPictureList.add(testPictureEntity3);

  test('HomeViewController.searchByNameAndDate() : Should return a PictureList with 2 itens', () {
    final searchText = tSearchText;
    final list = tOriginalPictureList;

    bool existsDateOrTitle(PictureEntity element) {
      if ((element.title.toLowerCase().contains(searchText.toLowerCase())) ||
          (element.formatDateYYYYMMDD().contains(searchText.toLowerCase())) ||
          (element.formatDateMMMMDY().toLowerCase().contains(searchText.toLowerCase()))) {
        return true;
      }
      return false;
    }

    final listFiltered = list.where((element) => existsDateOrTitle(element)).toList();
    tSearchedPictureList = listFiltered;

    expect(tSearchedPictureList.length, 2);
  });
}
