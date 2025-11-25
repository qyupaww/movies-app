import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/bloc/list_bloc/list_bloc.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/empty_widget.dart';
import 'package:movies_app/widgets/vertical_movie_list_widget.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "My List",
          style: TextStyle(
            color: ColorPallete.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: ColorPallete.white,
              size: 24,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<MyListBloc, MyListState>(
            bloc: BlocProvider.of<MyListBloc>(context)..add(MyListInitEvent()),
            buildWhen: (_, current) => current.status == MyListStatus.loaded,
            builder: (context, state) {
              if (state.status == MyListStatus.loaded) {
                return VerticalMovieListWidget(
                  title: "Favorites",
                  movies: state.movies,
                );
              } else if (state.status == MyListStatus.empty) {
                return const EmptyWidget();
              } else {
                return const SizedBox();
              }
            }),
      ),
    );
  }
}
