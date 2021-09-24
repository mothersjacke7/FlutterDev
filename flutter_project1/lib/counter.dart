import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  const Counter(this.value, {Key? key}) : super(key: key);

  final int value;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$value',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
