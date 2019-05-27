import 'package:app2/src/ui/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FieldEditingScreen extends StatelessWidget {
  // final String title;
  final Widget itemWidget;
  FieldEditingScreen(this.itemWidget);
  @override
  Widget build(BuildContext context) {
    // final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return DefalutLayout(
      title: Text("Dadad "),
      content: Center(
        child: Text("COLOR JEL"),
      ),
    );
  }
}
