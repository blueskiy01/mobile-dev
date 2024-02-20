import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  String _firstName = "blue";
  String _lastName = "skiy";
  String _email = "blue@skiy.ax";
  String _phone = "+358 888 88888";
  DateTime _currentDate = DateTime.now();
  DateTime _birthDate = DateTime(1993, 03, 03);

  HomeScreen({Key? key});

  int _getAge() {
    int age = _currentDate.year - _birthDate.year;

    if (_currentDate.month < _birthDate.month ||
        (_currentDate.month == _birthDate.month && _currentDate.day < _birthDate.day)) {
      age--;
    }

    return age;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("BizzCard"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Transform.translate(
          offset: Offset(0, 0.28 * MediaQuery.of(context).size.height), // Move up by 30% of screen height
          child: Container(
                padding: EdgeInsets.only(left: 90, right: 90, top: MediaQuery.of(context).size.height * 0.15),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      '$_firstName $_lastName',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      '${_getAge()} years old',
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      _email,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      _phone,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                ),
              ),
              const SizedBox(height: 20),
              Transform.translate(
                offset: Offset(0, -0.29 * MediaQuery.of(context).size.height), // Move up by 5% of screen height
                child: Container(
                  width: 220,
                  height: 250,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/profile.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
