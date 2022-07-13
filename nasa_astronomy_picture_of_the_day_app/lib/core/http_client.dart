class HttpClient {
  static const String baseUrl = "https://api.nasa.gov/planetary/apod";
  static const String apiKey = "uu8DEr43eF20KKXHvgVZQJeIwvJa5903Ny71jnOy";

  Uri httpClient(String startDate) {
    final uri = Uri.parse("$baseUrl?api_key=${apiKey}start_date=$startDate");
    return uri;
  }
}

//https://api.nasa.gov/planetary/apod?api_key=uu8DEr43eF20KKXHvgVZQJeIwvJa5903Ny71jnOy&start_date=2022-01-01