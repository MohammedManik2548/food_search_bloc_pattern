import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_search_bloc_pattern/bloc/botton_nav_bar/nav_bar_bloc.dart';
import 'package:food_search_bloc_pattern/bloc/botton_nav_bar/nav_bar_state.dart';

class BottomNavigationBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: _buildPage(state.tabIndex),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.tabIndex,
            onTap: (index) {
              //context.read<NavigationBloc>().add(index);
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPage(int currentIndex) {
    switch (currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return SearchScreen();
      case 2:
        return ProfileScreen();
      default:
        return Container(); // Handle invalid index
    }
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Screen'));
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Search Screen'));
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Screen'));
  }
}