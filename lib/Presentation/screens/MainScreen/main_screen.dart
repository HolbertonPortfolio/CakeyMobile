import 'package:auto_route/auto_route.dart';
import 'package:cakey_portfolio/Presentation/screens/MainScreen/Pages/home/home_screen.dart';
import 'package:cakey_portfolio/cubits/add_pastry/add_pastry_cubit.dart';
import 'package:cakey_portfolio/res/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Pages/add_pastry/add_pastry_screen.dart';
import 'Pages/profile/profile_screen.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    BlocProvider(
      create: (context) => AddPastryCubit(),
      child: const AddPastryScreen(),
    ),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.pinkAccent,
        unselectedItemColor: AppColors.mutedPink,
        backgroundColor: AppColors.lightPink,
        onTap: _onItemTapped,

      ),
    );
  }
}
