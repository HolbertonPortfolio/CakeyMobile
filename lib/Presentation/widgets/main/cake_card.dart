import 'package:cakey_portfolio/Data/pastry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CakeCardWidget extends StatelessWidget {
  final Pastry pastry;

  const CakeCardWidget({super.key, required this.pastry});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 159.h,
            //width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[300],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                pastry.imageUrl,
                fit: BoxFit.cover,
                width: 168.h,
                height: 159.h,
                errorBuilder: (BuildContext context, Object exception, stackTrace) {
                  return Image.asset('assets/images/tort.png', fit: BoxFit.cover,);
                },
              ),
            ),
          ),
          Text(
            pastry.name,
            style: GoogleFonts.lato(
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: Colors.green[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
