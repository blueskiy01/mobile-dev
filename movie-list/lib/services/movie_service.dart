import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/movie.dart';


class MovieService {
  Future<List<Movie>> fetchMovies() async {
    final String response = await rootBundle.loadString('assets/data/movies.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Movie.fromJson(json)).toList();
  }
}