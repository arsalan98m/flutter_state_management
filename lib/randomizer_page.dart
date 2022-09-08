import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizerPage extends HookWidget {
  final int min, max;
  final randomGenerator = Random();

  RandomizerPage({
    Key? key,
    required this.min,
    required this.max,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _generatedNumber = useState<int?>(null);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Randomizer',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text(_generatedNumber.value?.toString() ?? "Generate a number",
              style: const TextStyle(
                fontSize: 32,
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Generate'),
        onPressed: () {
          // min = 10
          // max = 20
          _generatedNumber.value = min + randomGenerator.nextInt(max + 1 - min);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
