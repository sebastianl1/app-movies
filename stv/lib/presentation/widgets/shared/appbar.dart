import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});


  @override
  Widget build(BuildContext context) {

    //final colors = Theme.of(context);
    //final titlestyle = Theme.of(context).textTheme.titleLarge;



    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: SizedBox(
          width: double.infinity,
          child: Row(
            children: [
              const Icon( Icons.movie_outlined, color: Colors.white),
              const SizedBox( width: 5,),
              const Text('phφsTv', style:TextStyle(color: Colors.white,fontSize: 24,fontStyle: FontStyle.italic)),
              const Spacer(),
              IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.white))
            ],) ),));
  }
}



