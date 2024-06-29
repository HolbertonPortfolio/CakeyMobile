import 'package:cakey_portfolio/res/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../../Api/pastry_api_methods.dart';
import '../home/widgets/pastry_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            _buildProfileHeader(),
            const TabBar(
              labelColor: AppColors.pinkAccent,
              unselectedLabelColor: Colors.grey,
              indicatorColor: AppColors.pinkAccent,
              tabs: [
                Tab(text: 'Added Pastries'),
                Tab(text: 'Favourite Pastries'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildAddedPastriesSection(),
                  _buildFavouritePastriesSection(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        color: AppColors.pink,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30.0),
        ),
      ),
      child: const Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/arzu.png'), // Replace with actual image
          ),
          SizedBox(height: 10),
          Text(
            'Arzumirzeb',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddedPastriesSection() {
    final pastriesFuture = PastryApiMethods().searchPastries('s');
    return PastryGrid(pastriesFuture: pastriesFuture);
  }

  Widget _buildFavouritePastriesSection() {
    final favoritePastriesFuture = PastryApiMethods().getPastriesByIngredients([30, 27, 7, 29]);
    return PastryGrid(pastriesFuture: favoritePastriesFuture);
  }
}
