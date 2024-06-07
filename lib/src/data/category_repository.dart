import 'dart:convert';
import 'package:flutter_filmes/src/data/model/category_item.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_filmes/src/data/api.dart';
import 'package:flutter_filmes/src/data/model/movie_item.dart';

class CategoryRepository {
  final http.Client _client = http.Client();

  static const baseUrl = Preferences.baseUrl;
  static final apiKey = Preferences.key;
  static const language = 'pt-BR';

  Future<List<CategoryItem>> getAllCategories() async {
    final params = {
      'language': language,
      'api_key': apiKey,
    };
    const path = '/3/genre/movie/list';
    final uri = Uri.https(baseUrl, path, params);
    final response = await _client.get(
      uri,
      headers: {
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> results = jsonResponse['genres'];
      return results.map((categoryJson) => CategoryItem.fromJson(categoryJson)).toList();
    } else {
      throw Exception('Erro ao obter os dados da API - get all categories');
    }
  }

  Future<List<MovieItem>> getMoviesByCategory(num id) async {
    final params = {
      'language': language,
      'api_key': apiKey,
      'with_genres': id.toString(),
    };
    const path = '/3/discover/movie';
    final uri = Uri.http(baseUrl, path, params);
    final response = await _client.get(
      uri,
      headers: {
        'accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> results = jsonResponse['results'];
      return results.map((movieJson) => MovieItem.fromJson(movieJson)).toList();
    } else {
      throw Exception('Erro ao obter os dados da -get movies by cat');
    }
  }
}