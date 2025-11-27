import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/recipe_detail_model.dart';

abstract class RecipeRemoteDataSource {
  Future<RecipeDetailModel> fetchDetails();
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  static const String _endpoint = 'https://test-api-jlbn.onrender.com/v2/feed/details';

  final http.Client client;

  RecipeRemoteDataSourceImpl({required this.client});

  @override
  Future<RecipeDetailModel> fetchDetails() async {
    final response = await client.get(Uri.parse(_endpoint));
    if (response.statusCode != 200) {
      throw Exception('Failed to load recipe details (${response.statusCode})');
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    return RecipeDetailModel.fromJson(data);
  }
}
