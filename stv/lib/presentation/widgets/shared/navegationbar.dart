import 'package:flutter/material.dart';

class BottonNavegation extends StatelessWidget {
  const BottonNavegation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      //elevation: 0,
      items: const [
        BottomNavigationBarItem(
        icon: Icon( Icons.home_max ),
        label: 'Inicio',
        backgroundColor: Colors.black ,
        ),
        BottomNavigationBarItem(
        icon: Icon( Icons.label_outline ),
        label: 'Categorias'
        ),
        BottomNavigationBarItem(
        icon: Icon( Icons.label_outline ),
        label: 'Favoritos'
        )   
             ]
      
    );
  }
}



