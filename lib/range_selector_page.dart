import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_randomizer/randomizer_page.dart';
import 'package:flutter_randomizer/widgets/range_selector_form.dart';

class RangeSelectorPage extends HookWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  RangeSelectorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _min = useState<int>(0);
    final _max = useState<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Range"),
      ),
      body: SafeArea(
        child: RangeSelectorForm(
          formKey: _formKey,
          minValueSetter: (value) => _min.value = value,
          maxValueSetter: (value) => _max.value = value,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Validating the form
          if (_formKey.currentState!.validate()) {
            _formKey.currentState?.save();

            // navigating to the generatorPage
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    RandomizerPage(min: _min.value, max: _max.value)));
          }
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
