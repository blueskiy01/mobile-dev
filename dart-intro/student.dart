class Person {
  String name;
  String cityOfOrigin;
  int age;
  int height;
  String? surname;

  Person(
    this.name,
    this.cityOfOrigin,
    this.age,
    this.height,
    this.surname,
  );
}

class Student extends Person {
  int batch;
  int level;
  String _secretKey = "01"; // Keep the private attribute with a default value

  // Correct the constructor to match the test's call
  Student(String name, String cityOfOrigin, int age, int height, int batch,
      int level,
      [String? surname] // Make surname an optional parameter
      )
      : this.batch = batch,
        this.level = level,
        super(name, cityOfOrigin, age, height,
            surname); // Move super call to the end

  // Additional methods or getters can go here
  String get secretKey => _secretKey;
}



// void main() {
//   // Create a Student object
//   Student student1 = Student(
//       name: 'John',
//       cityOfOrigin: 'New York',
//       age: 20,
//       height: 180,
//       batch: 2023,
//       level: 2);

//   print(
//       "Student 1: ${student1.name}, Batch: ${student1.batch}, Level: ${student1.level}");
// }