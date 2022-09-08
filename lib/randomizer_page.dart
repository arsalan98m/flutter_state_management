import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerPage extends StatefulWidget {
  final int min, max;

  const RandomizerPage({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  @override
  State<RandomizerPage> createState() => _RandomizerPageState();
}

class _RandomizerPageState extends State<RandomizerPage> {
  int? _generatedNumber;
  final randomGenerator = Random();

  @override
  Widget build(BuildContext context) {
    print("min=> ${widget.min}");
    print("max=> ${widget.max}");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Randomizer',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text(_generatedNumber?.toString() ?? "Generate a number",
              style: const TextStyle(
                fontSize: 32,
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Generate'),
        onPressed: () {
          setState(() {
            // min = 10
            // max = 20
            _generatedNumber = widget.min +
                randomGenerator.nextInt(widget.max + 1 - widget.min);
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
