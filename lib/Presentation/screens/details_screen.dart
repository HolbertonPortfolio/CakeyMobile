import 'package:auto_route/auto_route.dart';
import 'package:cakey_portfolio/Data/pastry_detail.dart';
import 'package:flutter/material.dart';
import 'package:cakey_portfolio/Api/pastry_api_methods.dart';

@RoutePage()
class PastryDetailsScreen extends StatelessWidget {
  final int pastryId;

  const PastryDetailsScreen({Key? key, @PathParam('id') required this.pastryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pastryApi = PastryApiMethods();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pastry Details'),
      ),
      body: FutureBuilder<PastryDetail>(
        future: pastryApi.getPastryById(pastryId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data found'));
          } else {
            final pastryDetail = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pastryDetail.name,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(pastryDetail.description),
                    const SizedBox(height: 16),
                    Image.network(pastryDetail.imageUrl),
                    const SizedBox(height: 16),
                    const Text(
                      'Ingredients:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ...pastryDetail.ingredients.map((ingredient) => Text(ingredient.name)).toList(),
                    const SizedBox(height: 16),
                    const Text(
                      'Recipe:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    ...pastryDetail.recipeSteps.map((step) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Step ${step.stepNumber}:',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(step.description),
                          Text('Timer: ${step.timer} seconds'),
                          const SizedBox(height: 8),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
