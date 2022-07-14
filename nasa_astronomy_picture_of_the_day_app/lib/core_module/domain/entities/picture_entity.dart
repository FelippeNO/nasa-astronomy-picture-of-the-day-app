class PictureEntity {
  final String title;
  final String url;
  final DateTime date;
  final String explanation;
  final String hdurl;

  PictureEntity({
    required this.date,
    required this.explanation,
    required this.hdurl,
    required this.url,
    required this.title,
  });
}
