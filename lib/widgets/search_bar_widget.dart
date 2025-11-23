import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants.dart';

import '../bloc/search_bloc/search_bloc.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  Timer? searchOnStoppedTyping;

  void _onChangeHandler(BuildContext context, String value) {
    const duration = Duration(milliseconds: 800);

    if (searchOnStoppedTyping != null) {
      setState(() {
        searchOnStoppedTyping!.cancel();
      });
    }

    setState(() {
      searchOnStoppedTyping = Timer(duration, () {
        BlocProvider.of<SearchBloc>(context).add(SearchQueryEvent(value));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: const BoxDecoration(
        color: ColorPallete.darkGrey,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            color: ColorPallete.grey,
            size: 28,
          ),
          const SizedBox(width: 4),
          Expanded(
            child: TextField(
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.top,
              onChanged: (value) {
                _onChangeHandler(context, value);
              },
              decoration: const InputDecoration(
                hintText: "Search movies...",
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: ColorPallete.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
              style: TextStyle(
                color: ColorPallete.white,
                fontSize: 14,
                fontWeight: FontWeight.normal,
                decoration: TextDecoration.none,
                decorationThickness: 0,
              ),
              cursorColor: ColorPallete.white,
              autofocus: true,
            ),
          ),
        ],
      ),
    );
  }
}
