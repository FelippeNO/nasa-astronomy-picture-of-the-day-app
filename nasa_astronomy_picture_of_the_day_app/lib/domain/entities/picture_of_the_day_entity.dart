class PictureOfTheDayEntity {
  final DateTime date;
  final String explanation;
  final String hdurl;
  final String url;
  final String title;

  PictureOfTheDayEntity(
      {required this.date, required this.explanation, required this.hdurl, required this.url, required this.title});
}
