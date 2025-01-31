import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:pj1/domain/repositories/world_time_repository.dart';
import 'package:pj1/presentation/pages/splash_page.dart';

import 'data/datasources/favorites_local_data_source.dart';
import 'data/datasources/world_time_remote_data_source.dart';
import 'data/repositories/world_time_repository_impl.dart';
import 'presentation/blocs/home/home_bloc.dart';
import 'presentation/blocs/favorites/favorites_bloc.dart';


void main() {
  final remoteDataSource = WorldTimeRemoteDataSourceImpl(client: http.Client());
  final localDataSource = FavoritesLocalDataSourceImpl();
  final repository = WorldTimeRepositoryImpl(
    remoteDataSource: remoteDataSource,
    localDataSource: localDataSource,
  );

  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final WorldTimeRepository repository;
  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(repository),
        ),
        BlocProvider<FavoritesBloc>(
          create: (_) => FavoritesBloc(repository),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'World Clock App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: SplashPage(),
      ),
    );
  }
}
