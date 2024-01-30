class Person {
  String name;
  String surname;
  String cityOfOrigin;
  int age;
  int height;

  // Constructor
  Person({
    required this.name,
    required this.cityOfOrigin,
    required this.age,
    required this.height,
    this.surname = '', // Optional parameter with a default value of an empty string
  });
}

void main() {
  // Creating an instance of the Person class
  Person person1 = Person(
    name: 'Johanna',
    surname: 'Doe',
    cityOfOrigin: 'Mariehamn, Åland',
    age: 30,
    height: 160,
  );

  // Accessing the attributes of the person1 instance
  print('Name: ${person1.name}');
  print('Surname: ${person1.surname}');
  print('City of Origin: ${person1.cityOfOrigin}');
  print('Age: ${person1.age}');
  print('Height: ${person1.height}');
}
