import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../widgets/ImageWidget.dart';
import '../widgets/TextWidget.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  MovieDetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(movie.title),
          backgroundColor: const Color(0xFF616161), // Set appbar background color to the desired color
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0), // Add bottom padding here
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Shadow color
                          spreadRadius: 3, // Spread radius (increased value)
                          blurRadius: 8, // Blur radius
                          offset: const Offset(0, 2), // Offset
                        ),
                      ],
                    ),
                    child: ImageWidget.detailedImage(movie.poster),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0), // Add left padding here
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextWidget.detailedText('Genres: ', movie.genre),
                      TextWidget.detailedText('Year: ', movie.year),
                      TextWidget.detailedText('Director: ', movie.director),
                      TextWidget.detailedText('Actors: ', movie.actors, newRow: true),
                      TextWidget.detailedText('Awards: ', movie.awards, newRow: true),
                      TextWidget.detailedText('Rating: ', movie.rating),
                      TextWidget.detailedText('IMDB rating: ', movie.imdbRating),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
