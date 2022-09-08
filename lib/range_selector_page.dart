import 'package:flutter/material.dart';
import 'package:flutter_randomizer/randomizer_page.dart';
import 'package:flutter_randomizer/widgets/range_selector_form.dart';

class RangeSelectorPage extends StatefulWidget {
  const RangeSelectorPage({Key? key}) : super(key: key);

  @override
  State<RangeSelectorPage> createState() => _RangeSelectorPageState();
}

class _RangeSelectorPageState extends State<RangeSelectorPage> {
  int _min = 0;
  int _max = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Range"),
      ),
      body: SafeArea(
        child: RangeSelectorForm(
          formKey: _formKey,
          minValueSetter: (value) => _min = value,
          maxValueSetter: (value) => _max = value,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Validating the form
          if (_formKey.currentState!.validate()) {
            _formKey.currentState?.save();

            // navigating to the generatorPage
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => RandomizerPage(min: _min, max: _max)));
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
