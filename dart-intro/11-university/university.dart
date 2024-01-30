class University {
  String _name;
  String _city;
  int? _ranking;

  University({
    required String name,
    required String city,
    int? ranking,
  })  : _name = name,
        _city = city,
        _ranking = ranking;

  String name() {
    return _name;
  }

  String city() {
    return _city;
  }

  int? ranking() {
    return _ranking;
  }

  void output() {
    if (_ranking == null) {
      print('Name: $_name, City: $_city');
    } else {
      print('Name: $_name, City: $_city, Ranking: $_ranking');
    }
  }
}

void main() {
  University u1 = University(
    name: 'University of Turku',
    city: 'Turku',
    ranking: 342,
  );
  University u2 = University(
    name: 'University of Helsinki',
    city: 'Helsinki',
    ranking: 115,
  );
  u1.output();
  u2.output();
}
