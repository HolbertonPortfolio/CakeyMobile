import 'package:auto_route/auto_route.dart';
import 'package:cakey_portfolio/Api/pastry_api_methods.dart';
import 'package:cakey_portfolio/Data/pastry.dart';
import 'package:cakey_portfolio/Presentation/routes/app_router.dart';
import 'package:cakey_portfolio/Presentation/widgets/main/cake_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pastryApi = PastryApiMethods();

    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
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
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Pastry>>(
                future: pastryApi.getAllPastries(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No data found'));
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
                            child: CakeCardWidget(pastry: snapshot.data![index]),);
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
