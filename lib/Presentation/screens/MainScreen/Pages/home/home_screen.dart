import 'package:cakey_portfolio/Api/pastry_api_methods.dart';
import 'package:cakey_portfolio/Data/pastry.dart';
import 'package:cakey_portfolio/Data/ingredient.dart';
import 'package:cakey_portfolio/Presentation/screens/MainScreen/Pages/home/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/ingredient_list.dart';
import 'widgets/pastry_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final PastryApiMethods pastryApi = PastryApiMethods();
  TextEditingController searchController = TextEditingController();
  Future<List<Pastry>>? _pastriesFuture;
  Future<List<Ingredient>>? _ingredientsFuture;
  String _query = '';

  @override
  void initState() {
    super.initState();
    _fetchPastries();
    _fetchIngredients();
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

  void _fetchIngredients() {
    setState(() {
      _ingredientsFuture = pastryApi.getAllIngredients();
    });
  }

  void _onSearchChanged() {
    setState(() {
      _query = searchController.text;
      _fetchPastries();
    });
  }

  void _filterPastriesByIngredients(List<int> ingredientIds) {
    setState(() {
      if (ingredientIds.isEmpty) {
        _fetchPastries();
      } else {
        _pastriesFuture = pastryApi.getPastriesByIngredients(ingredientIds);
      }
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
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            40.verticalSpace,
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0.w),
                child: Text(
                  'Catalogue',
                  style: GoogleFonts.lobster(
                    fontSize: 28.sp,
                    color: Colors.green[700],
                  ),
                ),
              ),
            ),
            10.verticalSpace,
            CustomSearchBar(searchController: searchController),
            10.verticalSpace,
            IngredientList(
              ingredientsFuture: _ingredientsFuture,
              onIngredientsSelected: _filterPastriesByIngredients,
            ),
            10.verticalSpace,
            Expanded(
              child: PastryGrid(pastriesFuture: _pastriesFuture),
            ),
          ],
        ),
      ),
    );
  }
}
