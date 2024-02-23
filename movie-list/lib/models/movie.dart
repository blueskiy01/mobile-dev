class Movie {
  final String genre;
  final String imdbRating;
  final String title;
  final String year;
  final String poster;
  final String runtime;
  final String director;
  final String actors;
  final String rating;
  final String awards;


  Movie(this.genre, this.imdbRating, this.title, this.year, this.poster,
      this.runtime, this.director, this.actors, this.rating,
      this.awards);

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        json["Genre"],
        json["imdbRating"],
        json["Title"],
        json["Year"],
        json["Poster"],
        json["Runtime"],
        json["Director"],
        json["Actors"],
        json["Rated"],
        json["Awards"]
    );
  }
}