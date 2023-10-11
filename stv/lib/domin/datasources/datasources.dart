

import 'package:stv/domin/entites/movie.dart';

abstract class MovieDataSource {

 Future<List<Movie>> getNowPlaying({ int page = 1});


}