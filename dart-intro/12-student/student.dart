class Person {
  String name;
  String? lastname;
  String cityOfOrigin;
  int age;
  int height;

  // Constructor
  Person({
    required this.name,
    this.lastname,
    required this.cityOfOrigin,
    required this.age,
    required this.height,
  });
}

class Student extends Person {
  int batch;
  int level;
  String _secretKey = "01"; // Private attribute with a default value

  // Constructor
  Student({
    required String name,
    String? lastname,
    required String cityOfOrigin,
    required int age,
    required int height,
    required this.batch,
    required this.level,
    String? secretKey,
  }) : super(
          name: name,
          lastname: lastname,
          cityOfOrigin: cityOfOrigin,
          age: age,
          height: height,
        ) {
    if (secretKey != null) {
      this._secretKey = secretKey;
    }
  }

  @override  
  // Method to output student information
  void output() {
    if (lastname == null && _secretKey == null) {
      print(
       'Name: $name, City of origin: $cityOfOrigin, age: $age, height: $height');
    } else if (lastname != null && _secretKey == null) {
      print(
          'Name: $name, City of origin: $cityOfOrigin, age: $age, height: $height, lastname: $lastname');
    } else if (lastname == null && _secretKey != null) {
      print(
          'Name: $name, City of origin: $cityOfOrigin, age: $age, height: $height, secret key: $_secretKey');
    } else if (lastname != null && _secretKey != null) {
      print(
          'Name: $name, City of origin: $cityOfOrigin, age: $age, height: $height, lastname: $lastname, secret key: $_secretKey');
    }
  }
}

void main() {
  // Creating an instance of the Student class
  Student myStudent1 = Student(
    name: 'Johanna',
    cityOfOrigin: 'Mariehamn, Åland',
    age: 30,
    height: 160,
    batch: 2024,
    level: 3,
  );

  Student myStudent2 = Student(
      name: 'Johanna',
      lastname: 'Doe',
      cityOfOrigin: 'Mariehamn, Åland',
      age: 30,
      height: 160,
      batch: 2024,
      level: 3,
      );

  Student myStudent3 = Student(
      name: 'Johanna',
      lastname: 'Doe',
      cityOfOrigin: 'Mariehamn, Åland',
      age: 30,
      height: 160,
      batch: 2024,
      level: 3,
      secretKey: '02');

  myStudent1.output();
  myStudent2.output();
  myStudent3.output();
}
