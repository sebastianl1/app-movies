import 'package:stv/domain/entites/movie.dart';

abstract class MoviesDatasource {

  Future<List<Movie>> getNowPlaying({ int page = 1 });

  Future<List<Movie>> getPopularity({ int page = 1 });

  Future<List<Movie>> getTopRated({ int page = 1 });

  Future<List<Movie>> getUpcoming({ int page = 1 });

  Future<Movie> getId(String id );


}