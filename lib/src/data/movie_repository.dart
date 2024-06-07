import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_filmes/src/data/api.dart';
import 'package:flutter_filmes/src/data/model/movie_item.dart';

import 'model/favorites_list.dart';

class MovieRepository {
  final http.Client _client = http.Client();

  static const baseUrl = Preferences.baseUrl;
  static final apiKey = Preferences.key;
  static const language = 'pt-BR';
  final FavoritesList _favoritesList = FavoritesList();

  Future<List<MovieItem>> getNowPlayingMovies({int page = 1}) async {
    final params = {
      'language': language,
      'page': page.toString(),
      'api_key': apiKey,
    };

    const path = '/3/movie/now_playing';
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
      throw Exception('Erro ao obter os dados da API - now playing \n ${response.body}');
    }
  }

  Future<MovieItem> getMovieById(
    int movieId,
  ) async {
    final params = {
      'language': language,
      'api_key': apiKey,
    };
    final path = '/3/movie/$movieId';
    final uri = Uri.http(baseUrl, path, params);
    final response = await _client.get(
      uri,
      headers: {
        'accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return MovieItem.fromJson(jsonResponse);
    } else {
      throw Exception('Erro ao obter os dados da API - get movie by id');
    }
  }

  Future<List<MovieItem>> getFavoriteMovies() async {
    List<MovieItem> favorites = [];
    for (var movieId in _favoritesList.favoriteMovieIds) {
      try {
        MovieItem movie = await getMovieById(movieId.toInt());
        favorites.add(movie);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    }
    return favorites;
  }

}
