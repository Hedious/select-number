import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Select Number'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedNumber = 0;
  int _firstRandomNumber = 0;
  int _secondRandomNumber = 0;
  int _thirdRandomNumber = 0;
  int _score = 0;
  final String _baseImgPath = 'assets/images/';
  String _firstImage = "";
  String _secondImage = "";
  String _thirdImage = "";
  String _resultMessage = "";

  _MyHomePageState() {
    _generateRandomNumber();
    _setImagePath();
  }

  void _generateRandomNumber() {
    _firstRandomNumber = Random().nextInt(9) + 1;

    _secondRandomNumber = Random().nextInt(9) + 1;
    while (_secondRandomNumber == _firstRandomNumber) {
      _secondRandomNumber = Random().nextInt(9) + 1;
    }

    _thirdRandomNumber = Random().nextInt(9) + 1;
    while (_thirdRandomNumber == _firstRandomNumber ||
        _thirdRandomNumber == _secondRandomNumber) {
      _thirdRandomNumber = Random().nextInt(9) + 1;
    }

    int chooseRandomNumber = Random().nextInt(3) + 1;

    if (chooseRandomNumber == 1) {
      _selectedNumber = _firstRandomNumber;
    } else if (chooseRandomNumber == 2) {
      _selectedNumber = _secondRandomNumber;
    } else {
      _selectedNumber = _thirdRandomNumber;
    }
  }

  void _setImagePath() {
    _firstImage = _baseImgPath + _firstRandomNumber.toString() + '.png';
    _secondImage = _baseImgPath + _secondRandomNumber.toString() + '.png';
    _thirdImage = _baseImgPath + _thirdRandomNumber.toString() + '.png';
  }

  void _checkNumber(int num) {
    setState(() {
      if (num == _selectedNumber) {
        _resultMessage = 'Your answer is correct';
        _score += 10;
      } else {
        _resultMessage = 'Your answer is incorrect';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(children: [
            Text(
              'Please Select Number $_selectedNumber',
              style: const TextStyle(color: Colors.blue, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                _checkNumber(_firstRandomNumber);
              }, // Handle your callback.
              child: Ink(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  image: DecorationImage(
                    image: AssetImage(_firstImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                _checkNumber(_secondRandomNumber);
              }, // Handle your callback.
              child: Ink(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  image: DecorationImage(
                    image: AssetImage(_secondImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                _checkNumber(_thirdRandomNumber);
              }, // Handle your callback.
              child: Ink(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  image: DecorationImage(
                    image: AssetImage(_thirdImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              _resultMessage,
              style: const TextStyle(color: Colors.blue, fontSize: 18),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 100.0,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(width: 1.0, color: Colors.blue),
                ),
                onPressed: () {
                  setState(() {
                    _resultMessage = "";
                    _generateRandomNumber();
                    _setImagePath();
                  });
                },
                child: const Text('Next', style: TextStyle(color: Colors.blue)),
              ),
            ),
            Text(
              'Score : $_score',
              style: const TextStyle(color: Colors.blue, fontSize: 18),
            ),
          ]),
        ));
  }
}
