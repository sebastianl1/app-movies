// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stv/domain/entites/movie.dart';
import 'package:stv/presentation/providers/movies/movieinfoprovider.dart';

class MovieScreen extends ConsumerStatefulWidget {

  static const name= 'movie-screen';

  final String movieId;


  const MovieScreen({
    super.key, 
    required this.movieId});

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ref.read(MovieInfoProvider.notifier).loadMovie(widget.movieId);


  }


  @override
  Widget build(BuildContext context) {

    final Movie?  movie = ref.watch( MovieInfoProvider )[widget.movieId];

    if (movie == null){
      return const Scaffold(body: Center(child: CircularProgressIndicator( strokeWidth: 2)));
    }


    return Scaffold(

      body: CustomScrollView(
        physics: const ClampingScrollPhysics(),
        slivers: [
          CustomSliverAppbar(movie: movie,),

        ],
      ),
    );
  }
}

class CustomSliverAppbar extends StatelessWidget {

  final Movie movie;




  const CustomSliverAppbar({super.key, 
  required this.movie});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;


    return SliverAppBar(
      backgroundColor: Colors.black,
      expandedHeight: size.height * 0.6,
      foregroundColor: Colors.white,
      shadowColor: Colors.red,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          movie.title,
          style:const TextStyle(fontSize: 16),
          textAlign: TextAlign.start,
          ),
        background: Stack(
          children:[

            SizedBox.expand(
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox.expand(
              child: DecoratedBox(decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.3,0.8],
                  colors: [
                  Colors.transparent,
                  Colors.black87
                ])
                
              )),
            ),
            const SizedBox.expand(
              child: DecoratedBox(decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  stops: [0.0,0.4],
                  colors: [
                    Colors.black87,
                  Colors.transparent,
                  
                ])
                
              )),
            )

          ]
        ),
        centerTitle: true,
      ),
      //title: Text(movie.title),



    );
  }
}





