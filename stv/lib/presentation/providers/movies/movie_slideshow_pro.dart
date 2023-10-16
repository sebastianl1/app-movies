import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stv/domain/entites/movie.dart';
import 'package:stv/presentation/providers/movies/movies_providers.dart';

// ignore: non_constant_identifier_names
final MoviesSlideProviders = Provider<List<Movie>>((ref) {


  final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );

  if (nowPlayingMovies.isEmpty ) return [];


  return nowPlayingMovies.sublist(0,8);

});



