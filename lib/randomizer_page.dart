import 'package:flutter/material.dart';
import 'package:flutter_randomizer/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

class RandomizerPage extends StatelessWidget {
  const RandomizerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Randomizer',
        ),
      ),
      body: SafeArea(
        child: Center(child: Consumer<RandomizerChangeNotifier>(
          builder: ((context, notifier, child) {
            return Text(
              notifier.generatedNumber?.toString() ?? "Generate a number",
              style: const TextStyle(
                fontSize: 32,
              ),
            );
          }),
        )),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Generate'),
        onPressed: () {
          context.read<RandomizerChangeNotifier>().generateRandomNumber();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
