import 'package:flutter/material.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({super.key});

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  late bool isFavourite;

  @override
  void initState() {
    isFavourite = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.grey[200],
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(
              scale: animation,
              child: child,
            ),
          );
        },
        child: IconButton(
          key: ValueKey<bool>(isFavourite),  // Ensure the key changes when isFavourite changes
          onPressed: () {
            setState(() {
              isFavourite = !isFavourite;
            });
          },
          icon: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_border,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
