import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/bloc/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:movies_app/model/movie_general.dart';
import 'package:movies_app/widgets/title_list_widget.dart';

import '../constants.dart';
import '../views/movie_detail_screen.dart';

class VerticalMovieGridWidget extends StatefulWidget {
  final String title;
  final List<MovieGeneral> movies;
  final bool isMovieDetail;

  const VerticalMovieGridWidget({
    required this.movies,
    required this.title,
    this.isMovieDetail = false,
    super.key,
  });

  @override
  State<VerticalMovieGridWidget> createState() =>
      _VerticalMovieGridWidgetState();
}

class _VerticalMovieGridWidgetState extends State<VerticalMovieGridWidget> {
  int _visibleCount = 0;
  final int _step = 9;

  @override
  void initState() {
    super.initState();
    _visibleCount = widget.movies.length < _step ? widget.movies.length : _step;
  }

  @override
  void didUpdateWidget(covariant VerticalMovieGridWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.movies != widget.movies) {
      _visibleCount =
          widget.movies.length < _step ? widget.movies.length : _step;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount = width >= 1000
        ? 6
        : width >= 800
            ? 5
            : width >= 600
                ? 4
                : 3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleListWidget(
          padding: EdgeInsets.only(left: widget.isMovieDetail ? 8.0 : 24.0),
          title: widget.title,
        ),
        const SizedBox(height: 8),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 2 / 3,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return BlocProvider.value(
                    value: BlocProvider.of<MovieDetailBloc>(context),
                    child: MovieDetailScreen(
                      arguments: {
                        ArgumentKey.idKey: widget.movies[index].id,
                        ArgumentKey.movieGenerealKey: widget.movies[index],
                      },
                    ),
                  );
                }));
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        "https://image.tmdb.org/t/p/w500/${widget.movies[index].posterPath}",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.65),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 8,
                      right: 8,
                      bottom: 8,
                      child: Text(
                        widget.movies[index].title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: _visibleCount,
        ),
        if (_visibleCount < widget.movies.length) ...[
          const SizedBox(height: 8),
          Center(
            child: TextButton(
              onPressed: () {
                setState(() {
                  _visibleCount = (_visibleCount + _step) > widget.movies.length
                      ? widget.movies.length
                      : _visibleCount + _step;
                });
              },
              child: const Text(
                "Load More",
                style: TextStyle(
                  color: ColorPallete.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
