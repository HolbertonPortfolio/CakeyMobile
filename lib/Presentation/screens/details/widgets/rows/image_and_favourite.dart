import 'package:cakey_portfolio/Presentation/screens/details/widgets/buttons/favourite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameAndFavouriteButton extends StatelessWidget {

  final String pastryName;
  const NameAndFavouriteButton({super.key, required this.pastryName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(
          flex: 12,
        ),
        SizedBox(
          width: 0.6.sw,
          child: Text(
            pastryName,
            style: TextStyle(
              height: 1.2,
              fontFamily: 'Haarith',
              fontSize: 28.sp,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const Spacer(
          flex: 3,
        ),
        const FavouriteButton(),
        const Spacer(
          flex: 1,
        ),
      ],
    );
  }
}
