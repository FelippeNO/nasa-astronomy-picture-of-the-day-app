import 'package:intl/intl.dart';

class PictureEntity {
  final String title;
  final String url;
  final DateTime date;
  final String explanation;

  PictureEntity({
    required this.date,
    required this.explanation,
    required this.url,
    required this.title,
  });

  String formatDateYYYYMMDD() {
    DateTime dateToParse = date;
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dateFormated = formatter.format(dateToParse);

    return dateFormated;
  }

  String formatDateMMMMDY() {
    DateTime dateToParse = date;
    final DateFormat formatter = DateFormat('MMMM d, y');
    final String dateFormated = formatter.format(dateToParse);

    return dateFormated;
  }
}
