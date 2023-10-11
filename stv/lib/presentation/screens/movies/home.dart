import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stv/config/constants/environment.dart';

class Home extends StatelessWidget {
  static const name = 'Home-screen';
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text( Environment.ApiKey),
    ),
    );
  }
}
