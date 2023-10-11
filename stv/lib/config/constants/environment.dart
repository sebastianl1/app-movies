import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {

 
  // ignore: non_constant_identifier_names
  static String ApiKey = dotenv.env['movies_db_key'] ?? 'NO EXISTE BASE DE DATOS';

}