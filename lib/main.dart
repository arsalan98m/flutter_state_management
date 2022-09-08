import 'package:flutter/material.dart';
import 'package:flutter_randomizer/randomizer_change_notifier.dart';
import 'package:flutter_randomizer/range_selector_page.dart';
import 'package:provider/provider.dart';

// lets now finally learn about what i would call a real state management solution although
// that certainly doesn't imply that we would be doing up untli now is not a real state management
// but for more complex app storing everything inside stateful widgets or the state associated classes
// or even inside hook become cumbersome or tedious

// What is ChangeNotifier and What is mutable state management?
// So we have been doing mutable state management all along sort of its not so a parent when we are using hooks because hooks are king of immutable sort of but when we were using stateful widgets  and we had these min and max as just two fields inside of a class and we were direclty re-assigning the values of these fields as you remember from a  few lessons back and we were still using stateful widgets that is mutable state management, mutable simply means that we are changing values in place, and you re-assign something directly that is changing the value in place so thats mean its mutable and ChangeNotifier is a mutable state management approcah thats mean we are again going to be re-assigning values in place.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RandomizerChangeNotifier(),
      child: MaterialApp(
        title: 'Randomizer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RangeSelectorPage(),
      ),
    );
  }
}
