import 'package:flutter/material.dart';
import 'package:cakey_portfolio/Data/ingredient.dart';

class IngredientList extends StatefulWidget {
  final Future<List<Ingredient>>? ingredientsFuture;
  final Function(List<int>) onIngredientsSelected;

  const IngredientList({
    Key? key,
    required this.ingredientsFuture,
    required this.onIngredientsSelected,
  }) : super(key: key);

  @override
  _IngredientListState createState() => _IngredientListState();
}

class _IngredientListState extends State<IngredientList> {
  List<int> selectedIngredients = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ingredient>>(
      future: widget.ingredientsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No ingredients found'));
        } else {
          return SizedBox(
            height: 100, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final ingredient = snapshot.data![index];
                final isSelected = selectedIngredients.contains(ingredient.id);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedIngredients.remove(ingredient.id);
                      } else {
                        selectedIngredients.add(ingredient.id);
                      }
                      widget.onIngredientsSelected(selectedIngredients);
                    });
                  },
                  child: Container(
                    width: 100, // Adjust width as needed
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      color: isSelected ? Colors.green[100] : null,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ingredient.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              ingredient.description,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
