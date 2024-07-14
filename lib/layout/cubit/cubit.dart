import 'package:bloc/bloc.dart';
import 'package:favorites/layout/cubit/states.dart';
import 'package:favorites/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<FavoritesStates> {
  FavoritesCubit() : super(FavoritesInitialState());

  static FavoritesCubit get(context) => BlocProvider.of(context);

  bool isFavorites = false;

  void changeFavorites(
  {bool? fromShared}
      ) {
    if(fromShared != null){
      isFavorites = fromShared;
      emit(FavoritesChangeState());
    }else{
      isFavorites = !isFavorites;
      CacheHelper.setData(key: 'isFavorites', value: isFavorites).then(
            (value) {
          emit(FavoritesChangeState());
        },
      );
    }
  }

}
