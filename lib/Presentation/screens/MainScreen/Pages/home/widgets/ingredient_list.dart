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
  IngredientListState createState() => IngredientListState();
}

class IngredientListState extends State<IngredientList> {
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
            height: 50, // Adjust height as needed
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
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.linear,
                    child: Card(
                      color: isSelected ? Colors.green[100] : null,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                        child: Row(
                          children: [
                            Text(
                              ingredient.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            isSelected ? const SizedBox(width: 4,) : const SizedBox.shrink(),
                            isSelected ? const Icon(Icons.check) : const SizedBox.shrink()
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
