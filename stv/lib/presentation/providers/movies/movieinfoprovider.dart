// ignore_for_file: non_constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stv/domain/entites/movie.dart';
import 'package:stv/presentation/providers/movies/move_repository_providers.dart';

final MovieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {

  final MoviesRepository = ref.watch( MovieRepositryProvider );

  return MovieMapNotifier(getMovie: MoviesRepository.getId);

});




typedef GetMovieCallBack = Future<Movie>Function( String movieId );

class MovieMapNotifier extends StateNotifier<Map<String,Movie>>{

  final GetMovieCallBack getMovie;
  

  MovieMapNotifier({
     required this.getMovie}
    ): super({});


  Future<void> loadMovie( String movieId ) async{

    if (state[movieId] != null ) return;

    //print('cargando peticion http');

    final movie = await getMovie( movieId );

    state = {...state, movieId: movie };

  }

}
