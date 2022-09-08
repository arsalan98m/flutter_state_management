import 'package:flutter/material.dart';
import 'package:flutter_randomizer/main.dart';
import 'package:flutter_randomizer/randomizer_change_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 1st way to use consumer
// class RandomizerPage extends StatelessWidget {
//   const RandomizerPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Consumer(
//       builder: ((context, ref, child) {
//         final _randomizerProvider = ref.watch(randomizerProvider);

//         return Scaffold(
//           appBar: AppBar(
//             title: const Text(
//               'Randomizer',
//             ),
//           ),
//           body: SafeArea(
//             child: Center(
//               child: Text(
//                 _randomizerProvider.generatedNumber?.toString() ??
//                     "Generate a number",
//                 style: const TextStyle(
//                   fontSize: 32,
//                 ),
//               ),
//             ),
//           ),
//           floatingActionButton: FloatingActionButton.extended(
//             label: const Text('Generate'),
//             onPressed: () {
//               _randomizerProvider.generateRandomNumber();
//             },
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerFloat,
//         );
//       }),
//     );
//   }
// }

// 2nd way to use consumer

class RandomizerPage extends ConsumerWidget {
  const RandomizerPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _randomizerProvider = ref.watch(randomizerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Randomizer',
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Text(
            _randomizerProvider.generatedNumber?.toString() ??
                "Generate a number",
            style: const TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Generate'),
        onPressed: () {
          _randomizerProvider.generateRandomNumber();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
