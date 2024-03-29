import 'package:app2/src/locale.dart';
import 'package:app2/src/ui/widgets/layouts/default_layout.dart';
import 'package:flutter/material.dart';

/**
 * 
 *  General App Configrations and settings
 * 
 */

class GeneralScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefalutLayout(
      title: Text(AppLocalizations.of(context).settings),
      content: Center(
        child: Text("General Settings", textScaleFactor: 2.2,),
      ),
    );
  }
}
