import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class CoreHttpClient {
  static const String baseUrl = "https://api.nasa.gov/planetary/apod";
  static const String apiKey = "uu8DEr43eF20KKXHvgVZQJeIwvJa5903Ny71jnOy";

  Uri httpClientUri(String startDate) {
    final uri = Uri.parse("$baseUrl?api_key=$apiKey&start_date=$startDate");
    return uri;
  }

  Future<Response> get(Uri uri) async {
    http.Response response = await http.get(uri);
    return response;
  }
}

//https://api.nasa.gov/planetary/apod?api_key=uu8DEr43eF20KKXHvgVZQJeIwvJa5903Ny71jnOy&start_date=2022-01-01