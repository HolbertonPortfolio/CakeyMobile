import 'dart:convert';
import 'package:cakey_portfolio/Api/api_provider.dart';
import 'package:cakey_portfolio/Data/pastry.dart';
import 'package:cakey_portfolio/Data/pastry_detail.dart';
import 'package:http/http.dart' as http;

import '../Data/ingredient.dart';

class PastryApiMethods {
  Future<List<Pastry>> getAllPastries() async {
    const url = '${ApiProvider.baseUrl}/pastries?limit=20'; // replace with your actual URL
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var pastriesJson = jsonDecode(response.body) as List;
      return pastriesJson.map((json) => Pastry.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load pastries');
    }
  }

  Future<PastryDetail> getPastryById(int id) async {
    final url = '${ApiProvider.baseUrl}/pastries/$id';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var pastryJson = jsonDecode(response.body);
      return PastryDetail.fromJson(pastryJson);
    } else {
      throw Exception('Failed to load pastry with id $id');
    }
  }

  Future<List<Pastry>> searchPastries(String query) async {
    final url = '${ApiProvider.baseUrl}/pastries/search/?query=$query';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var pastriesJson = jsonDecode(response.body) as List;
      return pastriesJson.map((json) => Pastry.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search pastries');
    }
  }


  Future<List<Ingredient>> getAllIngredients() async {
    const url = '${ApiProvider.baseUrl}/ingredients?limit=20'; // replace with your actual URL
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var ingredientsJson = jsonDecode(response.body) as List;
      return ingredientsJson.map((json) => Ingredient.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load ingredients');
    }
  }

  Future<List<Pastry>> getPastriesByIngredients(List<int> ingredientIds) async {
    final response = await http.post(
      Uri.parse('${ApiProvider.baseUrl}/pastries/by-ingredients'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'ingredients': ingredientIds}),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((e) => Pastry.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load pastries by ingredients');
    }
  }
}
