import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/world_time_model.dart';

abstract class WorldTimeRemoteDataSource {
  Future<WorldTimeModel> getWorldTime(String city);
}

class WorldTimeRemoteDataSourceImpl implements WorldTimeRemoteDataSource {
  final http.Client client;

  WorldTimeRemoteDataSourceImpl({required this.client});

  @override
  Future<WorldTimeModel> getWorldTime(String city) async {
    // Example: city = "Europe/London"
    final url = Uri.parse('http://worldtimeapi.org/api/timezone/$city');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return WorldTimeModel.fromJson(jsonBody, city);
    } else {
      throw Exception('Failed to fetch world time for $city');
    }
  }
}
