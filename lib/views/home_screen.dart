import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/hero_movie_widget.dart';
import 'package:movies_app/widgets/horizontal_movie_list.dart';
import 'package:movies_app/widgets/loading_widget.dart';

import '../bloc/home_bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            "Movix",
            style: TextStyle(
              color: ColorPallete.white,
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -1.2,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: ColorPallete.white, size: 28),
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.cast, color: ColorPallete.white, size: 28),
          ),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (_, current) => current.status == HomeStatus.loaded,
        builder: (context, state) {
          if (state.status == HomeStatus.loaded) {
            return ListView(
              children: [
                if (state.movie != null) HeroMovieWidget(movie: state.movie!),
                const SizedBox(height: 12),
                HorizontalMovieListWidget(
                  movieSection: state.sections[0],
                ),
                const SizedBox(height: 12),
                HorizontalMovieListWidget(
                  movieSection: state.sections[1],
                ),
                const SizedBox(height: 12),
                HorizontalMovieListWidget(
                  movieSection: state.sections[2],
                ),
                const SizedBox(height: 12),
                HorizontalMovieListWidget(
                  movieSection: state.sections[3],
                ),
                const SizedBox(height: 12),
                HorizontalMovieListWidget(
                  movieSection: state.sections[4],
                ),
                const SizedBox(height: 12),
                HorizontalMovieListWidget(
                  movieSection: state.sections[5],
                ),
                const SizedBox(height: 12),
              ],
            );
          } else if (state.status == HomeStatus.loading) {
            return const LoadingWidget();
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
