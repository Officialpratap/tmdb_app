import 'package:tmdb_app/model/movies.dart';
import 'package:tmdb_app/Repository/api_.dart';

class TMDBRepository {
  final TMDBApiClient tmdbApiClient;
  TMDBRepository({required this.tmdbApiClient});

  Future<List<Movie>> fetchMovies({required int page}) async {
    return await tmdbApiClient.fetchMovies(page: page);
  }
}
