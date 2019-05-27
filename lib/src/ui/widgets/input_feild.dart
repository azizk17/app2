import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String value;
  final String attr;
  final String label;
  final String error;
  final bool enabled;
  final Function onChanged;
  final id = InputDecoration(
    counter: Text("a"),
    counterText: "counter",
  );
  InputField(
      {this.value,
      this.label,
      this.attr,
      this.error,
      this.enabled = true,
      this.onChanged});
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: TextEditingController(text: this.value),
      decoration: InputDecoration(
        // labelText: this.label,
        hintText: this.label,
        errorText: this.error,
        labelStyle: Theme.of(context).inputDecorationTheme.labelStyle,
        errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
        border: Theme.of(context).inputDecorationTheme.border,

      ),
    );
  }
}
