import 'package:flutter/material.dart';
class DefaultLayout extends StatelessWidget {
  AppBar appBar;
  Widget body;

  DefaultLayout(
    this.appBar,
    this.body
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: body,
    );
  }
}