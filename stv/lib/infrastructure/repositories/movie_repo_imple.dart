
import 'package:stv/domain/datasources/datasources.dart';
import 'package:stv/domain/entites/movie.dart';
import 'package:stv/domain/repositories/moviesrepositories.dart';

class MovieRepositoryImpl extends MoviesRepository {

 final MoviesDatasource datasource;

  MovieRepositoryImpl(this.datasource);


  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {

    return datasource.getNowPlaying(page: page);  
  }
  
  @override
  Future<List<Movie>> getPopularity({int page = 1}) {

    return datasource.getPopularity(page: page);
   
  }

   @override
  Future<List<Movie>> getTopRated({int page = 1}) {

    return datasource.getTopRated(page: page);  
  }

   @override
  Future<List<Movie>> getUpcoming({int page = 1}) {

    return datasource.getUpcoming(page: page);  
  }
  
  @override
  Future<Movie> getId(String id) {

    return datasource.getId(id);
  }

}

