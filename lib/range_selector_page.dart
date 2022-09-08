import 'package:flutter/material.dart';
import 'package:flutter_randomizer/randomizer_page.dart';
import 'package:flutter_randomizer/widgets/range_selector_form.dart';

class RangeSelectorPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Range"),
      ),
      body: SafeArea(
        child: RangeSelectorForm(
          formKey: _formKey,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Validating the form
          if (_formKey.currentState!.validate()) {
            _formKey.currentState?.save();

            // navigating to the generatorPage
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => RandomizerPage()));
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
