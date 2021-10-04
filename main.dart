import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tmdb_app/Bloc/bloc.dart';
import 'package:tmdb_app/Repository/api_.dart';
import 'package:tmdb_app/Repository/repository.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_app/home_page.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }
}

class MyApp extends StatelessWidget {
  TMDBRepository tmdbRepository = TMDBRepository(
    tmdbApiClient: TMDBApiClient(
      httpClient: http.Client(),
    ),
  );

  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => MovieBloc(tmdbRepository: tmdbRepository)
          ..add(
            FetchMovies(),
          ),
        child: HomePage(),
      ),
    );
  }
}
