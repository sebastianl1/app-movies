import 'package:stv/config/constants/environment.dart';
import 'package:stv/domain/datasources/datasources.dart';
import 'package:stv/domain/entites/movie.dart';
import 'package:dio/dio.dart';
import 'package:stv/infrastructure/mappers/movemappers.dart';
import 'package:stv/infrastructure/models/movedb/movedbrespons.dart';
import 'package:stv/infrastructure/models/movedb/moviedetails.dart';

class MoviedbDatasource extends MoviesDatasource {

  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));

  List<Movie> _jsonTomovies( Map<String,dynamic> json ) {

    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster' )
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
  }
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    
    final response = await dio.get('/movie/now_playing',
    queryParameters: {
      'page' : page
    });
    
    return _jsonTomovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopularity({int page = 1}) async{
     final response = await dio.get('/movie/popular',
    queryParameters: {
      'page' : page
    });

    return _jsonTomovies(response.data);
    
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated',
    queryParameters: {
      'page' : page
    });

    return _jsonTomovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming',
    queryParameters: {
      'page' : page
    });

    return _jsonTomovies(response.data);
  }
  
  @override
  Future<Movie> getId(String id) async{

     final response = await dio.get('/movie/$id');

     if ( response.statusCode !=200  ) throw Exception('Movie with id: $id not found');

     final movieDetails = Moviedetails.fromJson(response.data);

     final Movie movie = MovieMapper.movieDbdetails(movieDetails);


    return movie;

  
  }
  
}


