import 'package:flutter/material.dart';
import 'package:flutter_randomizer/randomizer_change_notifier.dart';
import 'package:provider/provider.dart';

typedef IntValueSetter = void Function(int value);

class RangeSelectorForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const RangeSelectorForm({
    Key? key,
    required this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RangeSelectorTextFormField(
              labelText: "Minimum",
              intValueSetter: (value) =>
                  context.read<RandomizerChangeNotifier>().max = value,
            ),
            const SizedBox(
              height: 12,
            ),
            RangeSelectorTextFormField(
              labelText: "Maximum",
              intValueSetter: (value) =>
                  context.read<RandomizerChangeNotifier>().max = value,
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    Key? key,
    required this.labelText,
    required this.intValueSetter,
  }) : super(key: key);

  final String labelText;
  final IntValueSetter intValueSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return 'Must be an integer';
        }
        return null;
      },
      onSaved: (newValue) => intValueSetter(int.parse(newValue!)),
    );
  }
}
