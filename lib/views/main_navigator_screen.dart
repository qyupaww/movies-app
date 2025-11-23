import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/service/token_interceptor.dart';
import '../bloc/home_bloc/home_bloc.dart';
import '../service/tmdb_client_api.dart';
import 'home_screen.dart';

import 'my_list_screen.dart';
import 'search_screen.dart';

class MainNavigatorScreen extends StatefulWidget {
  const MainNavigatorScreen({super.key});

  @override
  State<MainNavigatorScreen> createState() => _MainNavigatorScreenState();
}

class _MainNavigatorScreenState extends State<MainNavigatorScreen> {
  late TmdbClientApi _tmdbClientApi;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tmdbClientApi = TmdbClientApi(
      Dio()..interceptors.add(TokenInterceptor()),
    );
  }

  final List<Widget> _buildScreen = [
    const HomeScreen(),
    const SearchScreen(),
    const MyListScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                HomeBloc(_tmdbClientApi)..add(HomeInitEvent())),
        BlocProvider(
            create: (context) => HomeBloc(_tmdbClientApi)..add(HomeInitEvent()))
      ],
      child: Scaffold(
        backgroundColor: ColorPallete.black,
        body: _buildScreen.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: ColorPallete.mineShaft,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: ColorPallete.grey,
              ),
              label: "Home",
              activeIcon: Icon(
                Icons.home,
                color: ColorPallete.white,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color: ColorPallete.grey,
              ),
              label: "Search",
              activeIcon: Icon(
                Icons.search,
                color: ColorPallete.white,
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.playlist_play,
                color: ColorPallete.grey,
              ),
              label: "My List",
              activeIcon: Icon(
                Icons.playlist_play,
                color: ColorPallete.white,
              ),
            ),
          ],
          selectedItemColor: ColorPallete.white,
          unselectedItemColor: ColorPallete.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
