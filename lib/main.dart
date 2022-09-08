import 'package:flutter/material.dart';
import 'package:flutter_randomizer/range_selector_page.dart';

// lets now take a look at something which is  one step above a statefulwiget and that state management solution is called flutter_hooks. this is a third party package

// When you work with teams on a large apps you are most likely not going to see all of the state management implemented with hooks but what you are going to see is hooks used just for the specific state like animation controllers or stream controllers or something like that most of the state in a large app is going to be implemented with another and more elaborate state management solution which we are going to focus on in the next branch and hooks are instead used for something where stateful  widgets will require a lot of boilerplate to be returned and we as programmers we wan't to write as little as code as possible and hooks are just fit for that

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Randomizer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RangeSelectorPage(),
    );
  }
}
