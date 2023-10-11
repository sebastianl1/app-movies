import 'package:stv/domin/entites/movie.dart';

abstract class MovieRepositories {

 Future<List<Movie>> getNowPlaying({ int page = 1});


}