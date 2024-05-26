import 'dart:convert';
import 'package:cakey_portfolio/Api/api_provider.dart';
import 'package:cakey_portfolio/Data/pastry.dart';
import 'package:http/http.dart' as http;

class PastryApiMethods {
  Future<List<Pastry>> getAllPastries() async {
    const url = '${ApiProvider.baseUrl}/pastries'; // replace with your actual URL
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var pastriesJson = jsonDecode(response.body) as List;
      return pastriesJson.map((json) => Pastry.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load pastries');
    }
  }
}
