import 'package:app2/src/ui/layouts/center_layout.dart';
import 'package:flutter/material.dart';

class EditFiledScreen extends StatelessWidget {

  const EditFiledScreen({@required String filed});
  @override
  Widget build(BuildContext context) {
    return CenterLayout(
      color: Theme.of(context).primaryColor,
      title: Container(),
      childern: <Widget>[

      ],
    );
  }
}