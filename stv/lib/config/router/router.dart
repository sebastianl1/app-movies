import 'package:go_router/go_router.dart';
import 'package:stv/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [ 

    GoRoute(path: '/',
    name: Home.name,
    builder:(context, state) => const Home(),

    )
    
  ]
);