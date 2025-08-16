// movie_streaming.dart

class Movie {
  // Private fields (data hiding)
  String _title;
  String _genre;
  int _releaseYear;
  double _averageRating = 0.0;
  int _ratingCount = 0;

  // Constructor
  Movie(this._title, this._genre, this._releaseYear);

  // Properties (getters and setters)
  String get title => _title;
  String get genre => _genre;
  int get releaseYear => _releaseYear;
  double get averageRating => _averageRating;

  // Method to add rating
  void addRating(double rating) {
    _averageRating = ((_averageRating * _ratingCount) + rating) / (++_ratingCount);
  }
}

class User {
  String name;
  List<Movie> watchlist = [];
  List<Movie> watchHistory = [];
  Map<Movie, double> ratings = {};

  User(this.name);

  void addToWatchlist(Movie movie) {
    if (!watchlist.contains(movie)) {
      watchlist.add(movie);
      print('$name added ${movie.title} to watchlist');
    }
  }

  void watchMovie(Movie movie) {
    if (!watchHistory.contains(movie)) {
      watchHistory.add(movie);
      print('$name watched ${movie.title}');
    }
  }

  void rateMovie(Movie movie, double rating) {
    if (!watchHistory.contains(movie)) {
      print('$name needs to watch ${movie.title} before rating.');
      return;
    }
    ratings[movie] = rating;
    movie.addRating(rating);
    print('$name rated ${movie.title} as $rating');
  }
}

class StreamingPlatform {
  List<Movie> movies = [];

  void addMovie(Movie movie) {
    movies.add(movie);
    print('Movie ${movie.title} added to platform');
  }

  List<Movie> recommend(User user) {
    // Simple recommendation: same genre as watched movies
    Set<String> watchedGenres = user.watchHistory.map((m) => m.genre).toSet();
    List<Movie> recommended = movies
        .where((m) => watchedGenres.contains(m.genre) && !user.watchHistory.contains(m))
        .toList();
    return recommended;
  }
}

void main() {
  // Create movies
  Movie movie1 = Movie('Inception', 'Sci-Fi', 2010);
  Movie movie2 = Movie('The Matrix', 'Sci-Fi', 1999);
  Movie movie3 = Movie('Titanic', 'Romance', 1997);
  Movie movie4 = Movie('Interstellar', 'Sci-Fi', 2014);

  // Create streaming platform
  StreamingPlatform netflix = StreamingPlatform();
  netflix.addMovie(movie1);
  netflix.addMovie(movie2);
  netflix.addMovie(movie3);
  netflix.addMovie(movie4);

  // Create user
  User alice = User('Alice');

  // User interactions
  alice.addToWatchlist(movie1);
  alice.watchMovie(movie1);
  alice.rateMovie(movie1, 5.0);

  alice.watchMovie(movie3);
  alice.rateMovie(movie3, 4.5);

  // Recommendations
  List<Movie> recs = netflix.recommend(alice);
  print('Recommended movies for ${alice.name}:');
  for (var m in recs) {
    print('${m.title} (${m.genre})');
  }
}
