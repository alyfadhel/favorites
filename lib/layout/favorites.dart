import 'package:favorites/layout/cubit/cubit.dart';
import 'package:favorites/layout/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoritesCubit, FavoritesStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = FavoritesCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              IconButton(
                onPressed: ()
                {
                  cubit.changeFavorites();
                },
                icon: CircleAvatar(
                  backgroundColor:
                      cubit.isFavorites ? Colors.grey : Colors.blue,
                  radius: 50.0,
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
