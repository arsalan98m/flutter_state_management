import 'package:flutter/foundation.dart';
import 'dart:math';

// Now how can we access this changeNotifier Object how can we do that well for that we have multiple options and we are going to focus on two of them in this branch it's going to be the 'provider' package and in the next branch it's going to be the 'riverPod' package.

// so 'provider' has been with us for quite sometime and it's used for well unsurprisngly providing things providing objects around the flutters widget tree we are going to use it right now it has some limitations and sometimes it can be quite cumbersome to work with and that's why 'riverpod' was born which is sort of new version of a provider.

class RandomizerChangeNotifier extends ChangeNotifier {
  final _randomGenerator = Random();

  int? _generatedNumber;
  int? get generatedNumber => _generatedNumber;

  int min = 0, max = 0;

  void generateRandomNumber() {
    _generatedNumber = min + _randomGenerator.nextInt(max + 1 - min);
    notifyListeners();
  }
}
