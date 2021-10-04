import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tmdb_app/model/movies.dart';

class TMDBApiClient {
  final baseURL = "https://api.themoviedb.org/3";
  final http.Client httpClient;
  TMDBApiClient({required this.httpClient});

  Future<List<Movie>> fetchMovies({required int page}) async {
    final List<Movie> movies = [];
    final url =
        "$baseURL/movie/popular?api_key=0fbc6b9bf4cebd9b826f15222da9e1ef&language=en-US&page=";
    final response = await httpClient.get(Uri.parse(url));
    if (response.statusCode != 200) {
      throw Exception('There was a problem');
    }
    final decodedJson = jsonDecode(response.body);
    for (var element in (decodedJson['results'] as List)) {
      movies.add(Movie.fromJson(element));
    }
    return movies;
  }
}
