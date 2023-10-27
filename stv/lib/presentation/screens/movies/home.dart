import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stv/presentation/providers/movies/FirstLoadProvider.dart';
import 'package:stv/presentation/providers/movies/movie_slideshow_pro.dart';
import 'package:stv/presentation/providers/movies/movies_providers.dart';
import 'package:stv/presentation/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottonNavegation(),
      body: _HomeView()
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
  
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularityMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedProvider.notifier).loadNextPage();
    ref.read(upComingProvider.notifier).loadNextPage();


   }
  
  @override
  Widget build(BuildContext context) {

    final firstLoad = ref.watch(firstLoadProvider);

    if (firstLoad) return const FullSrensLoader();



    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );

    // ignore: non_constant_identifier_names
    final Slideshowmovies = ref.watch( MoviesSlideProviders );
    final  popularMovies = ref.watch( popularityMoviesProvider );
    final topRated = ref.watch(topRatedProvider );
    final upComing = ref.watch( upComingProvider );

  
    return CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          floating: true,
          //itle: CustomAppBar(),
          //excludeHeaderSemantics: false,
          //expandedHeight: 60,
          backgroundColor: Colors.black,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            
            title: CustomAppBar(),),
          
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return  Container(
              margin: const EdgeInsets.symmetric(vertical : 5,),
              color: Colors.white30,
              child: Column(
                    children: [
                      //const CustomAppBar(),
                      MoviesSlideShow(movies: Slideshowmovies ),
                    
                      HorizontalView(
                         movies: nowPlayingMovies, 
                         title: 'Peliculas de ahora',
                         subtitle: 'Catalogo',
                         loadNextPage: (){ ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();},

                      ),
                      HorizontalView(
                         movies: popularMovies,
                         title: 'Populares',
                         subtitle: '...',
                         loadNextPage: (){ ref.read(popularityMoviesProvider.notifier).loadNextPage();},
              
                      ),
                      HorizontalView(
                        movies: topRated,
                        title: 'Mejor Valoradas',
                        subtitle: '...',
                        loadNextPage: (){ ref.read(topRatedProvider.notifier).loadNextPage();},
              
                      ),
                      HorizontalView(
                      movies: upComing,
                      title: 'Proximamente',
                      subtitle: '...',
                      loadNextPage: (){ ref.read(upComingProvider.notifier).loadNextPage();},
              
                      )
                
                     //SizedBox( height: 20 )
                    
                    
                    ],
                  ),
            );
      },
         childCount: 1,
        ))

      ],
    
    );
  }
}