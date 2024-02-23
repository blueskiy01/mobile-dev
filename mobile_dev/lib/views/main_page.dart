import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../views/movie_detail_page.dart';
import '../widgets/TextWidget.dart';
import '../services/movie_service.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<List<Movie>> _moviesFuture;
  List<Movie> _allMovies = [];
  List<Movie> _filteredMovies = [];
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();
  double _minRating = 0;
  double _maxRating = 10;

  @override
  void initState() {
    super.initState();
    _fetchAndSortMovies();
  }

  Future<void> _fetchAndSortMovies() async {
    List<Movie> movies = await MovieService().fetchMovies();
    movies.sort((a, b) {
      var ratingA = a.imdbRating != "N/A" ? double.tryParse(a.imdbRating) ?? 0 : 0;
      var ratingB = b.imdbRating != "N/A" ? double.tryParse(b.imdbRating) ?? 0 : 0;
      return ratingB.compareTo(ratingA);
    });
    setState(() {
      _allMovies = movies;
      _filteredMovies = movies; // Initialize _filteredMovies with all movies
    });
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
    });
    if (!_isSearching) {
      _searchController.clear();
      _filterMovies('');
    }
  }

  void _filterMovies(String query) {
    final queryLower = query.toLowerCase();
    setState(() {
      _filteredMovies = query.isEmpty
          ? _allMovies
          : _allMovies.where((movie) => movie.title.toLowerCase().contains(queryLower)).toList();
    });
  }

  void _updateRatingRange(double minRating, double maxRating) {
    setState(() {
      _minRating = minRating;
      _maxRating = maxRating;
      _filteredMovies = _allMovies.where((movie) {
        if (movie.imdbRating == 'N/A') return false;
        double rating = double.parse(movie.imdbRating);
        return rating >= minRating && rating <= maxRating;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: _isSearching ? _buildSearchField() : const Text('Movie List'),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            'Rating Filter',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RangeSlider(
              values: RangeValues(_minRating, _maxRating),
              min: 0,
              max: 10,
              divisions: 10,
              onChanged: (RangeValues values) {
                _updateRatingRange(values.start, values.end);
              },
              labels: RangeLabels(
                _minRating.toString(),
                _maxRating.toString(),
              ),
              activeColor: Colors.grey,
              // Set slider color to grey
            ),
          ),
          Expanded(
            child: _buildMovieGrid(),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _searchController,
      autofocus: true,
      decoration: const InputDecoration(
        hintText: "Search movies...",
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
      ),
      style: const TextStyle(color: Colors.white),
      onChanged: _filterMovies,
    );
  }

  Widget _buildMovieGrid() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
      ),
      itemCount: _filteredMovies.length,
      itemBuilder: (context, index) {
        final movie = _filteredMovies[index];
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MovieDetailPage(movie: movie)),
          ),
          child: Card(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Add padding here
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20), // Add a radius of 20%
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: AspectRatio(
                        aspectRatio: 3 / 4, // Adjust aspect ratio as needed
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            movie.poster,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/image/movie-poster-placeholder.png', fit: BoxFit.cover);
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(movie.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                          const SizedBox(height: 4),
                          Text('Rating: ${movie.imdbRating}', style: const TextStyle(fontSize: 14, color: Colors.black)),
                          Text('Genre: ${movie.genre}', style: const TextStyle(fontSize: 14, color: Colors.black)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
