import 'package:flutter/material.dart';
import 'package:flutter_randomizer/randomizer_change_notifier.dart';
import 'package:flutter_randomizer/range_selector_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// so with this package in place how we can use riverpod to provide object around the widget tree well we are providing our changeNotifier RandomizerChangeNotifier inside of main.dart file we just wrap the whole MaterailApp with our ChangeNotifierProvider coming from provider package and that was it so how can we provide this RandomizerChangeNotifier around the app with riverpod, the biggest problem of default provider package is the fact that to provide things we need to introduce these ChangeNotiferProvider widgets into our app currently we have only one of them so its fine but if you have multiple things which you want to provide then you have one provider here and another provider in some other place in the widget tree and another provider completely somewhere different and i mean you just mix your userinterface call your wigets with providing objects around the widget tree which is not very good right it's easy to create the mass it's easy to get lost in such a code

void main() {
  runApp(const MyApp());
}

final randomizerProvider =
    ChangeNotifierProvider((ref) => RandomizerChangeNotifier());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
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
