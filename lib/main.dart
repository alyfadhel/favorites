import 'package:favorites/layout/cubit/cubit.dart';
import 'package:favorites/layout/cubit/observer.dart';
import 'package:favorites/layout/cubit/states.dart';
import 'package:favorites/layout/favorites.dart';
import 'package:favorites/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool? isFavorites = CacheHelper.getData(key: 'isFavorites');
  runApp(
    MyApp(
      isFavorites: isFavorites,
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool? isFavorites;

  const MyApp({super.key, required this.isFavorites});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          FavoritesCubit()..changeFavorites(fromShared: isFavorites),
      child: BlocConsumer<FavoritesCubit, FavoritesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Favorites(),
          );
        },
      ),
    );
  }
}
