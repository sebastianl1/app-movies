
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stv/infrastructure/datasources/datasource_movie.dart';
import 'package:stv/infrastructure/repositories/movie_repo_imple.dart';

//solo lectura.
// ignore: non_constant_identifier_names
final MovieRepositryProvider = Provider((ref) {

  return MovieRepositoryImpl(MoviedbDatasource());


});


