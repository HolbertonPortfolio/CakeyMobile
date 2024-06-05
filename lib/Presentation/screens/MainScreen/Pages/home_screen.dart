import 'package:auto_route/auto_route.dart';
import 'package:cakey_portfolio/Api/pastry_api_methods.dart';
import 'package:cakey_portfolio/Data/pastry.dart';
import 'package:cakey_portfolio/Presentation/routes/app_router.dart';
import 'package:cakey_portfolio/Presentation/widgets/main/cake_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PastryApiMethods pastryApi = PastryApiMethods();
  TextEditingController searchController = TextEditingController();
  Future<List<Pastry>>? _pastriesFuture;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _fetchPastries();
    searchController.addListener(_onSearchChanged);
  }

  void _fetchPastries() {
    setState(() {
      if (_query.isEmpty) {
        _pastriesFuture = pastryApi.getAllPastries();
      } else {
        _pastriesFuture = pastryApi.searchPastries(_query);
      }
    });
  }

  void _onSearchChanged() {
    setState(() {
      _query = searchController.text;
      _fetchPastries();
    });
  }

  @override
  void dispose() {
    searchController.removeListener(_onSearchChanged);
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'Catalogue',
                  style: GoogleFonts.lobster(
                    fontSize: 28,
                    color: Colors.green[700],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search for pastries...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Pastry>>(
                future: _pastriesFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data found'));
                  } else {
                    return GridView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7409090909,
                      ),
                      itemBuilder: (context, index) {
                        final pastry = snapshot.data![index];
                        return GestureDetector(
                          onTap: () {
                            context.router.replace(PastryDetailsRoute(pastryId: pastry.id));
                          },
                          child: CakeCardWidget(pastry: pastry),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
