import 'package:http/http.dart';
import 'package:http/http.dart' as http;

abstract class ICoreHttpClient {
  Future<Response> getPicturesFromDate(String startDate);
  Future<Response> getPictureByDate(String date);
}

class CoreHttpClient implements ICoreHttpClient {
  static const String _baseUrl = "https://api.nasa.gov/planetary/apod";
  static const String _apiKey = "uu8DEr43eF20KKXHvgVZQJeIwvJa5903Ny71jnOy";

  @override
  Future<Response> getPicturesFromDate(String startDate) async {
    final uri = Uri.parse("$_baseUrl?api_key=$_apiKey&start_date=$startDate");
    http.Response response = await http.get(uri);
    return response;
  }

  @override
  Future<Response> getPictureByDate(String date) async {
    final uri = Uri.parse("$_baseUrl?api_key=$_apiKey&date=$date");
    http.Response response = await http.get(uri);
    return response;
  }
}
