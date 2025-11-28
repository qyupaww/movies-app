import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/movie_detail_bloc/movie_detail_bloc.dart';
import '../constants.dart';
import '../views/movie_detail_screen.dart';
import 'rounded_image_widget.dart';
import 'title_list_widget.dart';
import '../model/movie_section.dart';

class HorizontalMovieListWidget extends StatefulWidget {
  final MovieSection movieSection;
  const HorizontalMovieListWidget({
    required this.movieSection,
    super.key,
  });

  @override
  State<HorizontalMovieListWidget> createState() => _HorizontalMovieListWidgetState();
}

class _HorizontalMovieListWidgetState extends State<HorizontalMovieListWidget> {
  late final ScrollController _controller;
  int _visibleCount = 0;
  final int _step = 10;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController()..addListener(_onScroll);
    _visibleCount = widget.movieSection.movies.length < _step
        ? widget.movieSection.movies.length
        : _step;
  }

  void _onScroll() {
    if (!_controller.hasClients) return;
    final position = _controller.position;
    if (position.pixels >= position.maxScrollExtent - 200) {
      if (_visibleCount < widget.movieSection.movies.length) {
        setState(() {
          _visibleCount = (_visibleCount + _step) > widget.movieSection.movies.length
              ? widget.movieSection.movies.length
              : _visibleCount + _step;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleListWidget(title: widget.movieSection.title),
          const SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: ListView.separated(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return RoundedImageWidget(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return BlocProvider.value(
                        value: BlocProvider.of<MovieDetailBloc>(context),
                        child: MovieDetailScreen(
                          arguments: {
                            ArgumentKey.idKey: widget.movieSection.movies[index].id,
                            ArgumentKey.movieGenerealKey:
                                widget.movieSection.movies[index],
                          },
                        ),
                      );
                    }));
                  },
                  path:
                      "https://image.tmdb.org/t/p/w500/${widget.movieSection.movies[index].posterPath}",
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(width: 8);
              },
              itemCount: _visibleCount,
            ),
          ),
        ],
      ),
    );
  }
}
