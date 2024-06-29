import 'package:cakey_portfolio/res/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.pink50,
          title: const Text('Profile'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Added Pastries'),
              Tab(text: 'Favourite Pastries'),
            ],
          ),
        ),
        body: Column(
          children: [
            _buildProfileHeader(),
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
            'Username',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddedPastriesSection() {
    // Replace with actual list of added pastries
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.cake),
          title: Text('Added Pastry ${index + 1}'),
        );
      },
    );
  }

  Widget _buildFavouritePastriesSection() {
    // Replace with actual list of favourite pastries
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.favorite),
          title: Text('Favourite Pastry ${index + 1}'),
        );
      },
    );
  }
}
