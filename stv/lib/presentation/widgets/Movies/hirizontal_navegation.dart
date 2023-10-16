import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stv/config/formats/fortmats.dart';
import 'package:stv/domain/entites/movie.dart';

class HorizontalView extends StatefulWidget {

  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallback? loadNextPage;


  const HorizontalView({
    super.key,
    required this.movies, 
    this.title, 
    this.subtitle,
    this.loadNextPage
  });

  @override
  State<HorizontalView> createState() => _HorizontalViewState();
}

class _HorizontalViewState extends State<HorizontalView> {

  final scrollControler = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    scrollControler.addListener(() {

      if ( widget.loadNextPage == null ) return;

      if ( (scrollControler.position.pixels + 300) >= scrollControler.position.maxScrollExtent ){
        
        widget.loadNextPage!();
      }


    });
  }

 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();



  }



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null || widget.subtitle != null)
          _Title( title: widget.title, subtitle: widget.subtitle, ),


          Expanded(
            child: ListView.builder(
              controller: scrollControler,
              itemCount: widget.movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return FadeInRight(child: _Slide(movie: widget.movies[index]));
                
              },
              )
          )
        ]
      ),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie; 


  const _Slide({ required this.movie});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 17),
      child: Column(
        //Imagen
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                movie.posterPath,
                fit: BoxFit.cover,
                width: 10,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(child: CircularProgressIndicator( strokeWidth: 2, )),
                    );
                  }
                  return GestureDetector(
                    onTap: () => context.push('/movie/${movie.id}'),
                    child: FadeIn(child: child),
                  );
                  
                  //return child;
                },
              ),
              
            ) 
          ),
        const SizedBox(height: 10,),
        //title
        SizedBox(
          width: 150,
          child: 
          Text( 
            movie.title,
            maxLines: 2,
            style: textStyle.titleSmall,
            
            
          ),
        ),
        //rating
       
        Row(
          children: [
            const Icon(Icons.star_half_outlined,color: Colors.black87,),
            Text('${movie.voteAverage}',style: textStyle.bodyMedium?.copyWith(color: Colors.black87 )),
            const SizedBox(width: 40,),
            Text(FormaNum.number(movie.popularity),style: textStyle.bodySmall,)
          ],
        )

        ],

      ),
    );
  }
}

//encabezado 
class _Title extends StatelessWidget {

  final String? title;
  final String? subtitle;


  const _Title({ this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;


    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)

            Text(title!, style: titleStyle),

          const Spacer(),
          if (subtitle != null)

            FilledButton.tonal(
              style: const ButtonStyle( visualDensity: VisualDensity.compact ),
              onPressed: (){}, 
              child: Text(subtitle!)
            )

        ],
      ),
    );
  }
}





