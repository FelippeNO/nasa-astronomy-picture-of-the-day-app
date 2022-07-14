import 'package:http/http.dart';
import 'package:http/http.dart' as http;

abstract class ICoreHttpClient {
  Future<Response> get(String startDate);
}

class CoreHttpClient implements ICoreHttpClient {
  static const String baseUrl = "https://api.nasa.gov/planetary/apod";
  static const String apiKey = "uu8DEr43eF20KKXHvgVZQJeIwvJa5903Ny71jnOy";

  @override
  Future<Response> get(String startDate) async {
    final uri = Uri.parse("$baseUrl?api_key=$apiKey&start_date=$startDate");
    http.Response response = await http.get(uri);
    return response;
  }
}

//https://api.nasa.gov/planetary/apod?api_key=uu8DEr43eF20KKXHvgVZQJeIwvJa5903Ny71jnOy&start_date=2022-01-01