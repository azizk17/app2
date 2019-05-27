import 'package:app2/src/ui/widgets/input_feild.dart';
import 'package:flutter/material.dart';

class EmailField extends InputField {
  EmailField({
    String value,
    String attr,
    String label,
    String error,
    bool enabled = true,
    Function onChanged,
  }) : super(
          value: value,
          error: error,
          label: label,
          attr: attr,
          enabled: enabled,
          onChanged: onChanged,
        );
}
