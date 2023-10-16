
// ignore_for_file: file_names
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_providers.dart';

final firstLoadProvider = Provider<bool>((ref) {

    
    final sptep1 = ref.watch( nowPlayingMoviesProvider ).isEmpty;
    final  step2 = ref.watch( popularityMoviesProvider ).isEmpty;
    final step3 = ref.watch(topRatedProvider ).isEmpty;
    final step4 = ref.watch( upComingProvider ).isEmpty;

    if (sptep1 || step2 || step3 || step4 ) return true;


    return false;


} );





