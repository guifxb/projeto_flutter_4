import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_filmes/src/data/api.dart';
import 'package:flutter_filmes/src/data/model/movie_item.dart';

class MovieRepository {

  final http.Client _client = http.Client();

  Future<List<MovieItem>> getNowPlayingMovies({String language = 'pt_BR', int page = 1}) async {
    final String url = '${Const.baseUrl}/movie/now_playing?language=$language&page=$page&api_key=${Const.key}';
    final response = await _client.get(
      Uri.parse(url),
      headers: {
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> results = jsonResponse['results'];
      return results.map((movieJson) => MovieItem.fromJson(movieJson)).toList();
    } else {
      throw Exception('Erro ao obter os dados da API');
    }
  }
}