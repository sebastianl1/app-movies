
// ignore_for_file: file_names
import 'package:flutter/material.dart';

class FullSrensLoader extends StatelessWidget {
  const FullSrensLoader({super.key});

  Stream<String> getLoadingMessages(){
     final mesagges = <String> [

    'Conectando con el servidor',
    'Obteniendo peticion http',
    'Procesando informacion',
    'Lo sentimos,no se encontro respuesta',
    'Te la creiste wey...jajaja',
  ];
    return Stream.periodic(const Duration(milliseconds:3000),(step){
      return mesagges[step];
    }).take(mesagges.length);
  }
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           //const Text('Cargando...'),
           const SizedBox(height: 10,),
           const CircularProgressIndicator(strokeWidth: 2,),

           StreamBuilder(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if ( !snapshot.hasData ) return const Text('cargando bro');

              return Text(snapshot.data!); 
            },
            ),

        ]
      ),
    );
  }
}



