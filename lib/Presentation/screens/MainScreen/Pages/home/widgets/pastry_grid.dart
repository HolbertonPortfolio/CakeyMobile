import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:cakey_portfolio/Data/pastry.dart';
import 'package:cakey_portfolio/Presentation/widgets/main/cake_card.dart';

import '../../../../../routes/app_router.dart';

class PastryGrid extends StatelessWidget {
  final Future<List<Pastry>>? pastriesFuture;

  const PastryGrid({
    Key? key,
    required this.pastriesFuture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Pastry>>(
      future: pastriesFuture,
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
    );
  }
}
