import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/home_models.dart';

abstract class HomeRemoteDataSource {
  Future<HomeDataModel> fetchHomeData();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  static const String _endpoint = 'https://test-api-jlbn.onrender.com/v2/feed';

  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<HomeDataModel> fetchHomeData() async {
    final response = await client.get(Uri.parse(_endpoint));
    if (response.statusCode != 200) {
      throw Exception('Failed to load home data (${response.statusCode})');
    }

    final data = json.decode(response.body) as Map<String, dynamic>;
    return HomeDataModel.fromJson(data);
  }
}
