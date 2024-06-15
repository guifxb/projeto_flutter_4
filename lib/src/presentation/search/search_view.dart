import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_filmes/src/cubit/search_cubit.dart';
import 'package:flutter_filmes/src/cubit/search_state.dart';
import 'package:flutter_filmes/src/presentation/search/movie_grid_view.dart';
import '../../data/model/movie_item.dart';


class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  SearchViewState createState() => SearchViewState();
}

class SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Widget renderBody(SearchState state) {
    if (state is SearchInitial) {
            return const Center(child: CircularProgressIndicator()); 
          }
           else if (state is SearchLoaded) {
            return MovieGridView(filteredMovies: state.searchResult,);
          } else if (state is SearchError) {
            return Text(state.message);
          }
          return Container();
        }
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(context),
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Scaffold(
        appBar: AppBar(
        title: TextField(
        controller: _searchController,
        decoration: const InputDecoration(
          hintText: 'O que você procura?',
          ),
        style: const TextStyle(fontSize: 16.0),
        onSubmitted: (value) {
          context.read<SearchCubit>().searchQuery(value);
          },
        ),
      ),
          body: renderBody(state));
          }
      )
    );
  }
}
