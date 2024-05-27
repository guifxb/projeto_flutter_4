import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/favorite_cubit.dart';
import '../../cubit/favorite_state.dart';
import '../search/movie_grid_view.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(context),
      child: BlocBuilder<FavoriteCubit, FavoriteState>(
        builder: (context, state) {
          if (state is FavoriteInitial) {
            context.read<FavoriteCubit>().fetchFavorites();
            return const CircularProgressIndicator();
          } else if (state is FavoriteLoaded) {
            return MovieGridView(filteredMovies: state.favoriteMovies);
          } else if (state is FavoriteError) {
            return Text(state.message);
          }
          return Container();
        },
      ),
    );
  }
}