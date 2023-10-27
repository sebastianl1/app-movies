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
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) => MovieDescription(movie: movie),
            childCount: 1


          ) )
          
        ],
      ),
    );
  }
}

class MovieDescription extends StatelessWidget {

  final Movie movie;

  // ignore: use_key_in_widget_constructors
  const MovieDescription({required this.movie});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    

    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //imagen
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(
                    movie.posterPath,
                    width: size.width*0.4,
                    //colorBlendMode: ,
                    ),
                ),
                
                const SizedBox(width: 10,),
    
                 // description 
    
                SizedBox(
                  width: (size.width - 40)*0.5,
                  child: Column(
                    children: [
                      //Text(movie.title, style: TextStyle(color: Colors.white, fontSize: 23)),
                      const Text('Resumen', style: TextStyle(color: Colors.white60, fontSize: 16),),
                      const SizedBox(height: 5,),
                      Text(movie.overview, style: const TextStyle(color: Colors.white60, fontSize: 11,),)
    
                    ],
                  ),
                )
              ],
            ) ,
            ),
            // generos
             Padding(
              padding: const EdgeInsets.all(8),
              child: Wrap(
                children: [
                  ...movie.genreIds.map((genero) => Container(
                    margin: const EdgeInsets.only(right: 9),
                    child: Chip(
                       label: Text(genero, style: const TextStyle(color: Colors.black87),),
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                       backgroundColor: Colors.white70,
                     ),
                  ),),
                  //const Placeholder()
                ],
              ),

              ),

            const SizedBox(height: 100,)
        ]
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
        title: 
        Text(
          movie.title,
          //crossAxisAlignment:CrossAxisAlignment.start
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





