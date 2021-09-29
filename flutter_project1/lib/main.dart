import 'package:flutter/material.dart';
import 'package:flutter_project1/counter.dart';
import 'package:flutter_project1/random_numers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Онлайн рандомизер'),
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
  int _value = 0;

  Future<void> _getRandomValue() async {
    final RandomNumbers randomNumbers = RandomNumbers.filled();
    final int randomInt = await randomNumbers.getRandomInt();
    setState(() {
      _value = randomInt;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'randomizer',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
            Counter(_value),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getRandomValue,
        tooltip: 'Рандом',
        child: const Icon(Icons.refresh),
        splashColor: Colors.purpleAccent,
      ),
    );
  }
}
