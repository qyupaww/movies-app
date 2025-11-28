import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/bloc/search_bloc/search_bloc.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/search_bar_widget.dart';
import 'package:movies_app/widgets/vertical_movie_list_widget.dart';

import '../widgets/vertical_movie_grid_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchBloc>(context).add(SearchInitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallete.black,
        body: ListView(
          children: [
            const SearchBarWidget(),
            const SizedBox(height: 12),
            BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (_, current) =>
                  current.status == SearchStatus.loaded ||
                  current.status == SearchStatus.loadedSearchResult,
              builder: (context, state) {
                if (state.status == SearchStatus.loaded) {
                  return VerticalMovieListWidget(
                    title: "Now Playing",
                    movies: state.movies,
                  );
                } else if (state.status == SearchStatus.loadedSearchResult) {
                  return VerticalMovieGridWidget(
                    title: "Results",
                    movies: state.movies,
                  );
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
